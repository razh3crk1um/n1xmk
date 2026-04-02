{config, ...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["dbus-update-activation-environment" "--systemd" "--all"];}
    {command = ["systemctl" "--user" "start" "graphical-session.target"];}
    {command = ["swaybg" "-i" "${../../assets/wallpapers/red-highlands-brown-moutains.jpg}"];}
    {command = ["xwayland-satellite"];}
    {command = ["xrdb" "-merge" "${config.xresources.path}"];}
    {command = ["ghostty"];}
    {command = ["wl-paste" "--type" "text" "--watch" "cliphist" "store"];}
    {command = ["wl-paste" "--type" "image" "--watch" "cliphist" "store"];}
    {command = ["sh" "-c" "sleep 2 && setxkbmap -layout us -variant dvorak"];}
  ];
}
