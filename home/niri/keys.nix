{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    terminal = "ghostty";
    launcher = "fuzzel";

    # mpc
    mpc-status = "mpc status | grep -q 'playing' && echo '▶ 正在播放' || echo '⏸ 已暂停'";
    mpc-title = "mpc current -f %file% | sed 's|.*/||; s/\\.[^.]*$//'";
    # mpc-title-full = "mpc current -f %file% | sed 's|.*/||'"; # with extension
    mpc-notify = "notify-send \"$(${mpc-status})\" \"$(${mpc-title})\"";
    mpc-toggle-notify = "mpc -q toggle && ${mpc-notify}";

    # wireplumber
    #volume-up = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"];
    #volume-down = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
    #volume-nor = spawn ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "25%"];
    #volume-mute = spawn ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];

    # pulseaudio
    volume-up = spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%";
    volume-down = spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%";
    volume-nor = spawn "pactl" "set-sink-volume" "@DEFAULT_SINK@" "25%";
    volume-mute = spawn "pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle";

    brightness-up = spawn ["brightnessctl" "set" "5%+"];
    brightness-down = spawn ["brightnessctl" "set" "5%-"];
  in {
    "super+return".action = spawn terminal;
    "super+shift+space".action = spawn launcher;
    "super+shift+backspace".action = close-window;

    "super+o".action = volume-down;
    "super+shift+o".action = volume-up;
    "super+semicolon".action = volume-nor;
    "super+control+semicolon".action = volume-mute;
    "super+f11".action = brightness-down;
    "super+shift+f11".action = brightness-up;
    "super+e".action = spawn ["mpc" "-q" "next"];
    "super+shift+semicolon".action = spawn ["mpc" "-q" "prev"];
    "super+shift+e".action = spawn-sh mpc-toggle-notify;
    "super+space".action = spawn-sh mpc-toggle-notify;
    "super+shift+d".action = spawn-sh mpc-notify;
    "super+d".action = spawn ["qs" "ipc" "call" "notif" "toggleNotifCenter"];
    "super+t".action = spawn-sh "cliphist list | fuzzel --dmenu --lines 20 --width 75 | cliphist decode | wl-copy";

    "super+u".action.screenshot = [];
    "super+shift+u".action.screenshot-window = {write-to-disk = true;};
    "super+shift+t".action.screenshot-screen = {write-to-disk = true;};

    "super+grave".action = toggle-overview;
    "super+f".action = fullscreen-window;
    "super+shift+f".action = toggle-window-floating;
    "super+q".action = switch-focus-between-floating-and-tiling;
    "super+shift+q".action = toggle-column-tabbed-display;

    "super+f5".action = spawn-sh "loginctl lock-session && sleep 0.2 && systemctl suspend";
    "super+shift+f5".action = spawn ["loginctl" "lock-session"];
    "super+alt+f5".action = quit;
    "super+f6".action = spawn ["btr"];
    "super+shift+f6".action = spawn ["mpr"];
    "super+alt+f6".action = spawn ["pkill" "-USR2" "waybar"];

    "super+m".action = maximize-column;
    "super+shift+m".action = switch-preset-column-width;
    "super+g".action = maximize-window-to-edges;
    "super+shift+g".action = switch-preset-window-height;
    #"super+shift+s".action = set-column-width "100%";

    "super+shift+slash".action = set-column-width "-10%";
    "super+slash".action = set-column-width "+10%";
    "super+shift+equal".action = set-window-height "-10%";
    "super+equal".action = set-window-height "+10%";

    "super+n".action = consume-or-expel-window-left;
    "super+shift+n".action = consume-or-expel-window-right;
    "super+bracketleft".action = consume-window-into-column;
    "super+bracketright".action = expel-window-from-column;

    "super+h".action = focus-column-left;
    "super+l".action = focus-column-right;
    "super+j".action = focus-window-down;
    "super+k".action = focus-window-up;

    "super+shift+h".action = move-column-left;
    "super+shift+l".action = move-column-right;
    "super+shift+j".action = move-window-down;
    "super+shift+k".action = move-window-up;
    "super+shift+w".action = move-column-to-first;
    "super+shift+v".action = move-column-to-last;
    "super+control+h".action = move-column-to-first;
    "super+control+l".action = move-column-to-last;

    "super+comma".action = focus-column-left;
    "super+period".action = focus-column-right;
    "super+shift+comma".action = focus-column-first;
    "super+shift+period".action = focus-column-last;
    "super+w".action = focus-column-first;
    "super+v".action = focus-column-last;

    "super+apostrophe".action = focus-workspace-up;
    "super+a".action = focus-workspace-down;

    "super+control+w".action = move-column-to-workspace-up;
    "super+control+v".action = move-column-to-workspace-down;

    "super+left".action = focus-column-first;
    "super+right".action = focus-column-last;
    "super+shift+left".action = move-column-to-first;
    "super+shift+right".action = move-column-to-last;

    "super+up".action = focus-workspace-up;
    "super+down".action = focus-workspace-down;
    "super+shift+up".action = move-workspace-up;
    "super+shift+down".action = move-workspace-down;

    "super+1".action.focus-workspace = "1";
    "super+2".action.focus-workspace = "2";
    "super+3".action.focus-workspace = "3";
    "super+4".action.focus-workspace = "4";
    "super+5".action.focus-workspace = "5";
    "super+6".action.focus-workspace = 6;
    "super+7".action.focus-workspace = 7;
    "super+8".action.focus-workspace = 8;
    "super+9".action.focus-workspace = 9;
    "super+0".action.focus-workspace = 5;
    "super+s".action.focus-workspace = 5;

    "super+shift+1".action.move-window-to-workspace = "1";
    "super+shift+2".action.move-window-to-workspace = "2";
    "super+shift+3".action.move-window-to-workspace = "3";
    "super+shift+4".action.move-window-to-workspace = "4";
    "super+shift+5".action.move-window-to-workspace = "5";
    "super+shift+6".action.move-window-to-workspace = 6;
    "super+shift+7".action.move-window-to-workspace = 7;
    "super+shift+8".action.move-window-to-workspace = 8;
    "super+shift+9".action.move-window-to-workspace = 9;
    "super+shift+0".action.move-window-to-workspace = 5;

    #"xf86audioraisevolume".action = volume-up;
    #"xf86audiolowervolume".action = volume-down;
    #"xf86mute".action = volume-down;
    #"xf86monbrightnessup".action = brightness-up;
    #"xf86monbrightnessdown".action = brightness-down;
  };
}
