{config, ...}: {
  xresources = {
    path = "${config.xdg.configHome}/xorg/Xresources";
    properties = {
      "Xft.dpi" = 192;
      "Xcursor.theme" = "BreezeX-RosePine-Linux";
      "Xcursor.size" = 24;

      #"bar-background" = "#1a1a1a";
      "*.color0" = "#1b1d1e";
      "*.color1" = "#d7005f";
      "*.color2" = "#44ff00";
      "*.color3" = "#ff8700";
      "*.color4" = "#1f75fe";
      "*.color5" = "#932fff";
      "*.color6" = "#00d7af";
      "*.color7" = "#bcbcbc";
      "*.color8" = "#555555";
      "*.color9" = "#d40000";
      "*.color10" = "#87ff00";
      "*.color11" = "#ffd000";
      "*.color12" = "#0087ff";
      "*.color13" = "#af5fff";
      "*.color14" = "#00ddff";
      "*.color15" = "#ffffff";

      #"Xft.autohint" = 1;
      #"Xft.lcdfilter" = "lcddefault";
      #"Xft.hintstyle" = "hintfull";
      #"Xft.hiting" = 1;
      #"Xft.antialias" = 1;
      "Xft.rgba" = "rgb";
    };
  };
}
