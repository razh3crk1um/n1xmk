{...}: {
  programs.niri = {
    settings = {
      window-rules = [
        {
          draw-border-with-background = false;
          open-maximized = true;
        }

        {
          matches = [
            {app-id = "imv";}
            {app-id = "mpv";}
            {app-id = "pavucontrol";}
          ];
          open-floating = true;
        }

        #{
        #  matches = [
        #    {app-id = "com.mitchellh.ghostty";}
        #    {app-id = "Alacritty";}
        #  ];
        #  #default-column-width = {proportion = 0.5;};
        #  open-maximized = false;
        #}

        {
          matches = [{app-id = "firefox";}];
          open-on-workspace = "2";
        }
        {
          matches = [{app-id = "steam";}];
          open-on-workspace = "4";
        }
        {
          matches = [{app-id = "org.telegram.desktop";}];
          open-on-workspace = "4";
        }
      ];
    };
  };
}
