{ 
  inputs,
  ...
}:

{
  imports = [
    inputs.niri.homeModules.niri
    ./niri.nix
    ./keys.nix
    ./rules.nix
    ./autostart.nix
  ];
}
