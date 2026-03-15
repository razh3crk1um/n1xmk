{ 
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    
    settings = {
      main = {
        font = "Sarasa Mono SC:size=18";
        terminal = "alacritty";
        layer = "overlay";
      };
      colors = {
        background = "1b1d1eff";
        text = "ffffffff";
        match = "df005fff";
        selection = "555555ff";
        selection-text = "87ff00ff";
        border = "df005fff";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
}
