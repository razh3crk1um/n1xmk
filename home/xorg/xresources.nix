{
  config,
  dna,
  ...
}: let
  c = dna.colors;
in {
  xresources = {
    path = "${config.xdg.configHome}/xorg/Xresources";
    properties = {
      "Xft.dpi" = 192;
      "Xft.rgba" = "rgb";
      "Xcursor.theme" = dna.cursor.theme;
      "Xcursor.size" = dna.cursor.size_x;

      "*.color0" = "${c.black}";
      "*.color1" = "${c.red}";
      "*.color2" = "${c.green}";
      "*.color3" = "${c.yellow}";
      "*.color4" = "${c.blue}";
      "*.color5" = "${c.magenta}";
      "*.color6" = "${c.cyan}";
      "*.color7" = "${c.white}";
      "*.color8" = "${c.bright_black}";
      "*.color9" = "${c.bright_red}";
      "*.color10" = "${c.bright_green}";
      "*.color11" = "${c.bright_yellow}";
      "*.color12" = "${c.bright_blue}";
      "*.color13" = "${c.bright_magenta}";
      "*.color14" = "${c.bright_cyan}";
      "*.color15" = "${c.bright_white}";
      #"bar-background" = "#1a1a1a";

      #"Xft.autohint" = 1;
      #"Xft.lcdfilter" = "lcddefault";
      #"Xft.hintstyle" = "hintfull";
      #"Xft.hiting" = 1;
      #"Xft.antialias" = 1;
    };
  };
}
