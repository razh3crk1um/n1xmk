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

    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };

  # systemd-boot
  boot.loader = {
    grub.enable = false;

    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };
  #boot.supportedFilesystems = ["ntfs"];

  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
  };

  # zram
  zramSwap.enable = true;

  # battery: ppd & upower
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

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
