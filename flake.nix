{
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-unstable";

    # clash-verge v2.4.3
    nixpkgs-tun-fix.url = "github:NixOS/nixpkgs/8c809a146a140c5c8806f13399592dbcb1bb5dc4";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #niri.url = "github:YaLTeR/niri";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.niri-stable.follows = "niri";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.m1uq0m5-n1xmk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        myColors = import ./assets/theme.nix;
      };
      modules = [
        inputs.disko.nixosModules.disko
        ./base/disko.nix
        ./base/configuration.nix
      ];
    };
  };
}
