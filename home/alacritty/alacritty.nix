{dna, ...}: let
  c = dna.colors;
  f = dna.font;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        bright = {
          black = c.bright_black;
          red = c.bright_red;
          green = c.bright_green;
          yellow = c.bright_yellow;
          blue = c.bright_blue;
          magenta = c.bright_magenta;
          cyan = c.bright_cyan;
          white = c.bright_white;
        };

        cursor = {
          cursor = c.white;
          text = c.red;
        };

        normal = {
          black = c.black;
          red = c.red;
          green = c.green;
          yellow = c.yellow;
          blue = c.blue;
          magenta = c.magenta;
          cyan = c.cyan;
          white = c.white;
        };

        primary = {
          background = c.bg;
          foreground = c.fg;
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      font = {
        size = f.size;

        bold = {
          family = f.family;
          style = "Bold";
        };

        italic = {
          family = f.family;
          style = "Italic";
        };

        bold_italic = {
          family = f.family;
          style = "Bold Italic";
        };

        normal = {
          family = f.family;
          style = "Semibold";
        };
      };

      keyboard.bindings = [
        {
          action = "Paste";
          key = "Paste";
        }
        {
          action = "Copy";
          key = "Copy";
        }
        {
          action = "ClearLogNotice";
          key = "L";
          mods = "Control";
        }
        {
          chars = "\\f";
          key = "L";
          mode = "~Vi";
          mods = "Control";
        }
        {
          action = "ScrollPageUp";
          key = "PageUp";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollPageDown";
          key = "PageDown";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollToTop";
          key = "Home";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollToBottom";
          key = "End";
          mode = "~Alt";
          mods = "Shift";
        }
        {
          action = "ScrollLineUp";
          key = "K";
          mods = "Alt";
        }
        {
          action = "ScrollLineDown";
          key = "J";
          mods = "Alt";
        }
        {
          action = "ScrollPageUp";
          key = "U";
          mods = "Alt";
        }
        {
          action = "ScrollPageDown";
          key = "D";
          mods = "Alt";
        }
        {
          action = "ScrollToBottom";
          key = "Space";
          mode = "Vi";
          mods = "Shift|Control";
        }
        {
          action = "ToggleViMode";
          key = "Space";
          mods = "Shift|Control";
        }
        {
          action = "ClearSelection";
          key = "Escape";
          mode = "Vi";
        }
        {
          action = "ScrollToBottom";
          key = "I";
          mode = "Vi";
        }
        {
          action = "ToggleViMode";
          key = "I";
          mode = "Vi";
        }
        {
          action = "ScrollLineUp";
          key = "Y";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ScrollLineDown";
          key = "E";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ScrollToTop";
          key = "G";
          mode = "Vi";
        }
        {
          action = "ScrollToBottom";
          key = "G";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "ScrollPageUp";
          key = "B";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ScrollPageDown";
          key = "F";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ScrollPageUp";
          key = "U";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ScrollPageDown";
          key = "D";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "Copy";
          key = "Y";
          mode = "Vi";
        }
        {
          action = "ClearSelection";
          key = "Y";
          mode = "Vi";
        }
        {
          action = "ClearSelection";
          key = "Copy";
          mode = "Vi";
        }
        {
          action = "ToggleNormalSelection";
          key = "V";
          mode = "Vi";
        }
        {
          action = "ToggleLineSelection";
          key = "V";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "ToggleBlockSelection";
          key = "V";
          mode = "Vi";
          mods = "Control";
        }
        {
          action = "ToggleSemanticSelection";
          key = "V";
          mode = "Vi";
          mods = "Alt";
        }
        {
          action = "Open";
          key = "Return";
          mode = "Vi";
        }
        {
          action = "Up";
          key = "K";
          mode = "Vi";
        }
        {
          action = "Down";
          key = "J";
          mode = "Vi";
        }
        {
          action = "Left";
          key = "H";
          mode = "Vi";
        }
        {
          action = "Right";
          key = "L";
          mode = "Vi";
        }
        {
          action = "Up";
          key = "Up";
          mode = "Vi";
        }
        {
          action = "Down";
          key = "Down";
          mode = "Vi";
        }
        {
          action = "Left";
          key = "Left";
          mode = "Vi";
        }
        {
          action = "Right";
          key = "Right";
          mode = "Vi";
        }
        {
          action = "First";
          key = "Key0";
          mode = "Vi";
        }
        {
          action = "Last";
          key = "Key4";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "FirstOccupied";
          key = "Key6";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "High";
          key = "H";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "Middle";
          key = "M";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "Low";
          key = "L";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "SemanticLeft";
          key = "B";
          mode = "Vi";
        }
        {
          action = "SemanticRight";
          key = "W";
          mode = "Vi";
        }
        {
          action = "SemanticRightEnd";
          key = "E";
          mode = "Vi";
        }
        {
          action = "WordLeft";
          key = "B";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "WordRight";
          key = "W";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "WordRightEnd";
          key = "E";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "Bracket";
          key = "Key5";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "SearchForward";
          key = "Slash";
          mode = "Vi";
        }
        {
          action = "SearchBackward";
          key = "Slash";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "SearchNext";
          key = "N";
          mode = "Vi";
        }
        {
          action = "SearchPrevious";
          key = "N";
          mode = "Vi";
          mods = "Shift";
        }
        {
          action = "Paste";
          key = "V";
          mods = "Control|Shift";
        }
        {
          action = "Copy";
          key = "C";
          mods = "Control|Shift";
        }
        {
          action = "SearchForward";
          key = "F";
          mods = "Control|Shift";
        }
        {
          action = "SearchBackward";
          key = "B";
          mods = "Control|Shift";
        }
        {
          action = "ClearSelection";
          key = "C";
          mode = "Vi";
          mods = "Control|Shift";
        }
        {
          action = "PasteSelection";
          key = "Insert";
          mods = "Shift";
        }
        {
          action = "ResetFontSize";
          key = "Key0";
          mods = "Control";
        }
        {
          action = "IncreaseFontSize";
          key = "Equals";
          mods = "Control";
        }
        {
          action = "IncreaseFontSize";
          key = "Plus";
          mods = "Control";
        }
        {
          action = "IncreaseFontSize";
          key = "NumpadAdd";
          mods = "Control";
        }
        {
          action = "DecreaseFontSize";
          key = "Minus";
          mods = "Control";
        }
        {
          action = "DecreaseFontSize";
          key = "NumpadSubtract";
          mods = "Control";
        }
      ];

      selection = {
        save_to_clipboard = true;
      };

      window = {
        decorations = "none";
        dynamic_padding = true;
        opacity = 0.7;
      };

      terminal = {
        osc52 = "CopyPaste";
      };

      general = {
        live_config_reload = true;
      };
    };
  };
}
