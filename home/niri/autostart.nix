{config, ...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["xwayland-satellite"];}
    {command = ["swaybg" "-i" "${../../assets/wallpapers/red-highlands-brown-moutains.jpg}"];}
    {command = ["xrdb" "-merge" "${config.xresources.path}"];}
    {command = ["mako"];}
    {command = ["waybar"];}
    {command = ["ghostty"];}
    {command = ["fcitx5" "-d"];}
    {command = ["hypridle"];}
    {command = ["clash-verge"];}
    {command = ["wl-paste" "--type" "text" "--watch" "cliphist" "store"];}
    {command = ["wl-paste" "--type" "image" "--watch" "cliphist" "store"];}
    {command = ["sh" "-c" "sleep 2 && setxkbmap -layout us -variant dvorak"];}
  ];
}
