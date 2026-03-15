{
  pkgs,
  #inputs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    #package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-stable;
    settings = {
      workspaces = {
        "1" = {};
        "2" = {};
        "3" = {};
        "4" = {};
        "5" = {};
      };

      prefer-no-csd = true;
      screenshot-path = "~/media/pictures/screenshots/%Y-%m-%d-%H%M%S_niri.png";

      hotkey-overlay = {
        skip-at-startup = true;
      };

      input = {
        keyboard = {
          xkb = {
            layout = "us";
            variant = "dvorak";
            options = "caps:swapescape";
          };
          repeat-delay = 250;
          repeat-rate = 39;
        };

        touchpad = {
          tap = true;
          dwt = true;
          natural-scroll = true;
        };

        #mouse = {
        #  accel-speed = 0.0;
        #  accel-profile = "flat";
        #  scroll-method = "no-scroll";
        #  natural-scroll = false;
        #};

        #warp-mouse-to-focus = false;
        #focus-follows-mouse max-scroll-amount = "0%";
      };

      outputs = {
        "eDP-1" = {
          #mode = {
          #  width = 2880;
          #  height = 1800;
          #  refresh = 90;
          #};
          scale = 2;
          position = {
            x = 0;
            y = 0;
          };
          #transform = "normal";
        };
      };

      cursor = {
        size = 32;
        theme = "BreezeX-RosePine-Linux";
      };

      layout = {
        gaps = 12;
        center-focused-column = "on-overflow"; # never, always, on-overflow
        default-column-width = {proportion = 0.50;};

        preset-column-widths = [
          #{ proportion = 0.33; }
          {proportion = 0.50;}
          {proportion = 1.00;}
        ];
        preset-window-heights = [
          #{ proportion = 0.33; }
          {proportion = 0.50;}
          {proportion = 1.00;}
        ];

        border = {
          enable = false;
          width = 2;
          active = {
            color = "#06040400";
          };
          inactive = {
            color = "#06040400";
          };
        };

        focus-ring = {
          enable = true;
          width = 2;
          active = {
            color = "#df005f";
          };
          inactive = {
            color = "#060404";
          };
        };

        #struts = {
        #  left   = 12;
        #  right  = 12;
        #  top    = 12;
        #  bottom = 12;
        #};
      };

      animations = {
        enable = true;
        slowdown = 1.0;
      };

      environment = {
        # base
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";

        # QT 5/6
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORMTHEME = "qt6ct";

        # gdk
        GDK_BACKEND = "wayland,x11";

        # misc
        MOZ_ENABLE_WAYLAND = "1";
        CLUTTER_BACKEND = "wayland";

        # fcitx
        #XMODIFIERS = "@im=fcitx";
        #QT_IM_MODULE  =  "fcitx";
        #QT_IM_MODULES =  "fcitx";
        #SDL_IM_MODULE =  "fcitx";
        ## firefox-fcitx5 blink
        #GTK_IM_MODULE =  null;

        #DISPLAY = ":0";
        #SDL_VIDEODRIVER = "wayland";
        #EGL_PLATFORM = "wayland";
        #NIXRO_OZONE_WL = "1";
        #XKB_DEFAULT_VARIANT = "dvorak";
        #HTTPS_PROXY = "192.168.253.126:2080";
        #HTTP_PROXY = "$HTTPS_PROXY";
      };

      #shadow = {
      #  enable = true;
      #  softness = 30;
      #  spread = 5;
      #  offset = {
      #    x = 0;
      #    y = 5;
      #  };
      #  color = "#0007";
      #};
    };
  };
}
