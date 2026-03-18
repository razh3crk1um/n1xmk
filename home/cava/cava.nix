{
  pkgs,
  dna,
  ...
}: {
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      #smoothing = {
      #  integral = 77;
      #  monstercat = 1;
      #};
      color = {
        #background = "default";

        gradient = 1;
        gradient_count = 4;

        gradient_color_1 = "'${dna.colors.red}'"; # bottom
        gradient_color_2 = "'${dna.colors.bright_red}'"; # top
      };
    };
  };
}
