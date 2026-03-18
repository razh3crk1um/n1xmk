{
  inputs,
  dna,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs dna;
    };

    users.razh3crk1um = {
      imports = [
        ../home/default.nix
      ];
    };
  };
}
