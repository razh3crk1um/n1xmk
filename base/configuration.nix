{...}: {
  imports = [
    ./disko.nix
    ./home.nix
    ./hardware-configuration.nix

    ../system/agenix.nix
    ../system/desktop.nix
    ../system/network.nix
    ../system/persistence.nix
    ../system/programs.nix
    ../system/security.nix
    ../system/system.nix
  ];

  system.stateVersion = "25.11";
}
