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

    users."${dna.user}" = {
      imports = [
        ../home/default.nix
      ];
    };
  };
}
