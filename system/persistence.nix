{inputs, ...}: {
  imports = [inputs.impermanence.nixosModules.impermanence];

  # persist
  fileSystems."/persist" = {
    neededForBoot = true;
  };

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/ssh"
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"

      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
      "/var/lib/systemd/coredump"
    ];

    files = [
      "/etc/machine-id"
    ];

    users.razh3crk1um = {
      directories = [
        ".ssh"
        ".pki"
        ".gnupg"
        ".config"
        ".local/share"
        ".local/state"

        ".tmux"
        ".steam"
        ".cache/mozilla"
        ".cache/nvim"
        ".cache/prezto"
        ".cache/fontconfig"

        ".n1xmk"
        "spawn"
        "docsx"
        "deskp"
        "media"
        "progm"
        "forge"
        "exprz"
      ];

      files = [
        #".bash_history"
        ".cache/fuzzel"
        ".cache/cliphist/db"
      ];
    };
  };
}
