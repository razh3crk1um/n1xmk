{inputs, ...}: {
  # nix
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    channel.enable = false;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    settings.auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;
  hardware = {
    enableAllFirmware = true;
    bluetooth.enable = true;
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

  # ssh agent
  programs.ssh.startAgent = true;

  # zram
  zramSwap.enable = true;

  # journald
  services.journald.extraConfig = ''
    SystemMaxUse=500M
  '';

  # time zone
  time.timeZone = "Asia/Shanghai";
}
