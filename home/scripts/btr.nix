{pkgs, ...}:
pkgs.writeShellApplication {
  name = "btr";
  runtimeInputs = [pkgs.bluez pkgs.libnotify];
  text = ''
    set +e

    MAC="40:72:18:10:C1:FE"

    echo "Reconnecting Bluetooth $MAC..."
    notify-send -u normal "蓝牙连接" "设备正在重连: $MAC"
    bluetoothctl disconnect "$MAC" >/dev/null 2>&1

    sleep 1
    if bluetoothctl connect "$MAC"; then
        notify-send -u normal "蓝牙连接" "设备连接成功: $MAC"
    else
        notify-send -u normal "蓝牙连接" "设备连接失败，请检查设备状态: $MAC"
    fi
  '';
}
