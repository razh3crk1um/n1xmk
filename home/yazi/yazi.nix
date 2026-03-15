{...}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        ratio = [1 3 4];
        show_hidden = true;
        sort_by = "mtime";
        sort_reverse = true;
        linemode = "mtime";
      };

      # preview
      #image_delay     = 30;
      #image_filter    = "triangle";

      # opener
      opener = {
        edit = [
          {
            run = ''nvim "$@"'';
            block = true;
            desc = "editor";
          }
        ];
        open = [
          {
            run = "imv \"$@\"";
            orphan = true;
            desc = "image";
          }
        ];
        play = [
          {
            run = "mpv \"$@\"";
            orphan = true;
            desc = "video";
          }
        ];
        read = [
          {
            run = "zathura \"$@\"";
            orphan = true;
            desc = "pdf";
          }
        ];
        browse = [
          {
            run = "firefox \"$@\"";
            orphan = true;
            desc = "browser";
          }
        ];
        reveal = [
          {
            run = "xdg-open \"$@\"";
            orphan = true;
            desc = "system";
          }
        ];
      };

      # rules
      open.rules = [
        {
          mime = "text/*";
          use = ["edit" "reveal"];
        }
        {
          mime = "image/*";
          use = ["open" "reveal"];
        }
        {
          mime = "{video,audio}/*";
          use = ["play" "reveal"];
        }
        {
          url = "*.pdf";
          use = ["read" "reveal"];
        }
        {
          mime = "inode/empty";
          use = ["edit" "reveal"];
        }
        {
          mime = "text/html";
          use = ["edit" "browse" "reveal"];
        }
        {
          url = "*.{html,svg}";
          use = ["edit" "browse" "reveal"];
        }
        {
          url = "*";
          use = "reveal";
        }
      ];
    };

    # keymaps
    keymap = {
      mgr = {
        prepend_keymap = [
          {
            run = "cd ~/spawn";
            on = ["g" "d"];
            desc = "spawn";
          }
          {
            run = "cd ~/.local/share";
            on = ["g" "l"];
            desc = "~/.local/share";
          }
          {
            run = "cd ~/.local/share/Trash";
            on = ["g" "b"];
            desc = "~/.local/share/Trash";
          }

          {
            run = "cd ~/media/pictures/screenshots";
            on = ["g" "s"];
            desc = "screenshots";
          }
          {
            run = "cd ~/media/music";
            on = ["g" "m"];
            desc = "music";
          }
          {
            run = "cd ~/media/ardour";
            on = ["g" "o"];
            desc = "ardour";
          }
          {
            run = "cd ~/media/vocaloid/pjs";
            on = ["g" "v"];
            desc = "vocaloid";
          }

          {
            run = "shell 'trash-put \"$@\"' ";
            on = ["d" "d"];
            desc = "trash-put";
          }
          #{ run = "shell 'trash-put --trash-dir ~/.local/share/Trash \"$@\"'"; on = [ "d" "d" ]; desc = "trash-put => ~/.local/share/Trash"; }
        ];
      };
    };
  };
}
