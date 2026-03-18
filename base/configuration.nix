{...}: {
  imports = [
    ./hardware-configuration.nix
    ./home.nix

    ../system/persistence.nix
    ../system/system.nix
    ../system/security.nix
    ../system/users.nix
    ../system/network.nix
    ../system/programs.nix
    ../system/desktop.nix
  ];

  system.stateVersion = "25.11";
}
