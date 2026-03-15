{pkgs, ...}: {
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

        gradient_color_1 = "'#d7005f'"; # bottom
        gradient_color_2 = "'#d40000'"; # top
      };
    };
  };
}
