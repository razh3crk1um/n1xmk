{
  inputs,
  dna,
  ...
}: {
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
      "/var/lib/systemd"
    ];

    files = [
      "/etc/machine-id"
    ];

    users."${dna.user}" = {
      directories = [
        ".ssh"
        ".pki"
        ".gnupg"
        ".config"
        ".local"

        ".tmux"
        ".steam"
        ".cache/mozilla"
        ".cache/nvim"

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
        ".cache/fuzzel"
        ".cache/cliphist/db"
      ];
    };
  };
}
