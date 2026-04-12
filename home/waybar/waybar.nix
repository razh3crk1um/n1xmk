{dna, ...}: let
  f = dna.font;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 0;
        fixed-center = false;
        reload_style_on_change = true;

        modules-left = [
          "idle_inhibitor"
          "custom/tl"

          "custom/br"
          "niri/workspaces"
          "custom/bl"
        ];
        modules-center = [
          "custom/tr"
          "mpd"
          "custom/tl"

          "custom/br"
          "niri/window"
          "custom/bl"
        ];
        modules-right = [
          "custom/tr"
          "network"
          "custom/bl"

          "custom/tr"
          "cpu"
          "custom/ar"
          "memory"
          "custom/ar"
          "temperature"
          "custom/bl"

          "custom/tr"
          #"wireplumber"
          "pulseaudio"
          "custom/ar"
          "battery"
          "custom/ar"
          "clock"
          "custom/bl"

          "custom/tr"
          "tray"
        ];
        "custom/tr" = {
          format = ""; # top right
          tooltip = false;
        };
        "custom/br" = {
          format = ""; # bottom right
          tooltip = false;
        };
        "custom/tl" = {
          format = ""; # top left
          tooltip = false;
        };
        "custom/bl" = {
          format = ""; # bottom left
          tooltip = false;
        };
        "custom/archlogo" = {
          format = "   ";
          tooltip = false;
        };
        "custom/nixlogo" = {
          #    󱄅
          format = "   ";
          tooltip = false;
        };
        "custom/ar" = {
          format = "";
          tooltip = false;
        };
        "niri/workspaces" = {
          format = "{icon}";
          all-outputs = true;
          format-icons = {
            "1" = "";
            "2" = "<span font-family='${f.glyphs.brands}'></span>";
            "3" = "";
            "4" = "<span font-family='${f.glyphs.brands}'></span>";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "default" = "";
          };
        };

        "mpd" = {
          format = "{stateIcon} {filename}";
          format-disconnected = "󰝛 disconnected";
          format-stopped = "󰓛 {stateIcon} {filename}";
          state-icons = {
            paused = "󰏤";
            playing = "󰐊";
          };
          tooltip-format = "{stateIcon} {filename}";
          tooltip-format-disconnected = "mpd (disconnected)";

          on-click = "mpc -q toggle";
          on-click-right = "mpc -q next";
          on-click-middle = "mpc -q prev";
          max-length = 30;
        };
        # 󱄅    󰭩  󰴑  󰓹
        "niri/window" = {
          format = "   {title:100}";
          separate-outputs = false;
          rewrite = {
            # "^$" = "   NixOS";
          };
        };
        "tray" = {
          #icon-size = 12;
          show-passive-items = true;
          spacing = 10;
        };
        "clock" = {
          format = "<span font-family='${f.glyphs.solid}'></span> {:%H:%M}";
          format-alt = "<span font-family='${f.glyphs.solid}'></span> {:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu" = {
          interval = 10;
          format = " {usage}%";
          tooltip = true;
        };
        "memory" = {
          interval = 20;
          format = " {}%";
          format-alt = " {swapUsed:0.1f}G[swap]";
          tooltip = true;
        };
        "temperature" = {
          interval = 15;
          critical-threshold = 80;
          tooltip = true;
          format = "{icon} {temperatureC}°C";
          format-icons = [""];

          # format = "<span font-family='${f.nerd}'>{icon}</span> {temperatureC}°C";
          # format-icons = ["" "" ""];
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };
        "network" = {
          interval = 1;
          format-wifi = " {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-ethernet = " {bandwidthDownBytes}  {bandwidthUpBytes}";
          tooltip-format = "󱂇  {ifname} via {gwaddr}";
          format-linked = "󱘖 {ifname} (no ip)";
          format-disconnected = " disconnected";
          format-alt = "󰈀  {ifname}: {ipaddr}/{cidr}";
          # format-wifi = "  {essid} ({signalStrength}%)";
          # format-ethernet = " {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          scroll-step = 5; # %, can be a float
          format = "{icon}{volume}%";
          format-bluetooth = "{icon} {volume}%";
          format-bluetooth-muted = "{icon} ";
          format-muted = " {volume}%";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
        "wireplumber" = {
          scroll-step = 0.05;
          format = "{icon}{volume}";
          format-muted = " {volume}";
          format-icons = [" " " " " "];
          on-click = "pavucontrol";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            #    
            activated = " ";
            deactivated = " ";
          };
        };
      };
    };
  };
}
