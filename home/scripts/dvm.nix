{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dvm";
  runtimeInputs = [pkgs.cryptsetup];
  text = ''
    set -e

    declare -A DISKS=(
        ["1"]="6a285788-6679-43c4-9df8-f1469271a318"
        ["2"]="71096b16-3312-4706-b680-23a90ef55a10"
    )

    if [ "$#" -lt 2 ]; then
        echo "usage: dvm [1|2] [ro|rw|umount]"
        exit 1
    fi

    ID="$1"
    MODE="$2"
    UUID=''${DISKS[$ID]}

    if [[ -z "$UUID" ]]; then
        echo "错误: 未定义的磁盘索引 '$ID'"
        exit 1
    fi

    DISK_PATH="/dev/disk/by-uuid/$UUID"
    MAPPER_NAME="vault_''${UUID:0:5}"
    MOUNT_POINT="/persist/mnt/''${MAPPER_NAME}"


    case "$MODE" in
        "ro" | "rw")
            [[ -b "$DISK_PATH" ]] || { echo "磁盘未连接"; exit 1; }

            if [[ -L "/dev/mapper/$MAPPER_NAME" ]]; then
                sudo umount "$MOUNT_POINT" 2>/dev/null || true
                sudo cryptsetup close "$MAPPER_NAME"
            fi

            CRYPTO_FLAGS=""
            MOUNT_FLAGS="force,uid=$(id -u),gid=$(id -g),iocharset=utf8"

            if [[ "$MODE" == "ro" ]]; then
                CRYPTO_FLAGS="--readonly"
                MOUNT_FLAGS="''${MOUNT_FLAGS},ro"
            else
                MOUNT_FLAGS="''${MOUNT_FLAGS},rw"
            fi

            echo "解密磁盘 $UUID ($MODE)..."
            sudo cryptsetup bitlkOpen "$DISK_PATH" "$MAPPER_NAME" $CRYPTO_FLAGS

            sudo mkdir -p "$MOUNT_POINT"
            sudo mount -t ntfs3 -o "$MOUNT_FLAGS" "/dev/mapper/$MAPPER_NAME" "$MOUNT_POINT"
            echo "挂载成功: $MOUNT_POINT"
            ;;

        "um")
            echo "正在卸载磁盘 $UUID ..."
            sudo umount "$MOUNT_POINT" 2>/dev/null || echo "跳过卸载"
            if [[ -L "/dev/mapper/$MAPPER_NAME" ]]; then
                sudo cryptsetup close "$MAPPER_NAME"
            fi
            echo "已锁定并可安全拔出。"
            ;;

        *)
            echo "usage: dvm [1|2] [ro|rw|umount]"
            exit 1
            ;;
    esac
  '';
}
