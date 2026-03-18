{
  dna,
  lib,
  ...
}: let
  c = dna.colors;
in {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "${dna.font.family}:size=${toString dna.font.size_lg}";
        #terminal = "alacritty";
        layer = "overlay";
      };
      colors = {
        background = "${lib.removePrefix "#" c.black}ff";
        text = "${lib.removePrefix "#" c.bright_white}ff";
        match = "${lib.removePrefix "#" c.red}ff";
        selection = "${lib.removePrefix "#" c.bright_black}ff";
        selection-text = "${lib.removePrefix "#" c.bright_green}ff";
        border = "${lib.removePrefix "#" c.red}ff";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
}
