{inputs, ...}: {
  nixpkgs.config.allowUnfree = true;

  # nix
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    channel.enable = false;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    settings.auto-optimise-store = true;
    #gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 7d"; };
  };

  # nh
  programs.nh = {
    enable = true;
    #flake = "/etc/nixos";

    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };

  # hardware
  boot.loader = {
    grub.fontSize = 32;
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 10;
  };
  #boot.supportedFilesystems = ["ntfs"];

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
  };

  # zram
  zramSwap.enable = true;

  # ppd
  services.power-profiles-daemon.enable = true;

  # ssd
  services = {
    fstrim.enable = true;

    smartd = {
      enable = true;
      autodetect = true;
      notifications.wall.enable = true;
    };
  };

  # journald
  services.journald.extraConfig = ''
    SystemMaxUse=500M
  '';

  # time zone
  time.timeZone = "Asia/Shanghai";
}
