{myColors, ...}: let
  c = myColors.colors;
in {
  programs.zellij = {
    enable = true;
    #enableZshIntegration = true;

    settings = {
      theme = "molokai";
      copy_on_select = true;
      mirror_session = true;

      simplified_ui = true;
      show_startup_tips = false;
      pane_frames = false;
      #mouse_mode = false;

      keybinds = {
        normal = {
          #"bind \"Alt ,\"" = {SwitchToMode = "Pane";};
          #"bind \"Alt '\"" = {SwitchToMode = "Tab";};
          "bind \"Alt '\"" = {Detach = {};};
        };

        pane = {
          "bind \"h\" \"Left\"" = {MoveFocus = "Left";};
          "bind \"l\" \"Right\"" = {MoveFocus = "Right";};
          "bind \"j\" \"Down\"" = {MoveFocus = "Down";};
          "bind \"k\" \"Up\"" = {MoveFocus = "Up";};

          "bind \"n\"" = {NewPane = "Right";};
          "bind \"d\"" = {NewPane = "Down";};
          "bind \"x\"" = {CloseFocus = {};};
          "bind \"m\"" = {
            ToggleFocusFullscreen = {};
            SwitchToMode = "Normal";
          };
          "bind \"f\"" = {TogglePaneEmbedOrFloating = {};};
          "bind \"z\"" = {TogglePaneFrames = {};};

          "bind \"Esc\" \"Alt ,\"" = {SwitchToMode = "Normal";};
        };

        tab = {
          "bind \"h\" \"Left\"" = {GoToPreviousTab = {};};
          "bind \"l\" \"Right\"" = {GoToNextTab = {};};
          "bind \"n\"" = {NewTab = {};};
          "bind \"x\"" = {CloseTab = {};};

          "bind \"Esc\" \"Alt .\"" = {SwitchToMode = "Normal";};
        };
      };
    };

    themes = {
      molokai = {
        themes.molokai = {
          fg = c.white;
          bg = c.lightblack;

          red = c.red;
          green = c.lightgreen;
          yellow = c.lightyellow;
          blue = c.blue;
          magenta = c.magenta;
          cyan = c.cyan;
          orange = c.yellow;
          black = c.black;
          white = c.white;
        };
      };
    };
  };
}
