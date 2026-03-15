{
  inputs,
  myColors,
  ...
}:
{

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs myColors;
    };
  
    users.razh3crk1um ={
      imports = [
        ../home/default.nix
      ];
    };
  };
}
