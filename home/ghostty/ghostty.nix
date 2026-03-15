{myColors, ...}: let
  c = myColors.colors;
in {
  programs.ghostty = {
    enable = true;
    settings = {
      linux-cgroup = "always"; # always, never, single-instance
      copy-on-select = "clipboard";
      scrollbar = "never";
      scrollback-limit = "10000";
      window-inherit-working-directory = false;
      working-directory = "home";
      window-decoration = false;
      custom-shader-animation = false;

      keybind = [
        "alt+u=scroll_page_up"
        "alt+d=scroll_page_down"
      ];

      font-family = "Sarasa Mono CL Semibold";
      #font-size = 12;
      background = c.bg;
      background-opacity = 0.7;
      foreground = c.fg;
      cursor-color = c.white;
      cursor-style = "block";
      #cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      palette = [
        "0=${c.black}"
        "1=${c.red}"
        "2=${c.green}"
        "3=${c.yellow}"
        "4=${c.blue}"
        "5=${c.magenta}"
        "6=${c.cyan}"
        "7=${c.white}"
        "8=${c.lightblack}"
        "9=${c.lightred}"
        "10=${c.lightgreen}"
        "11=${c.lightyellow}"
        "12=${c.lightblue}"
        "13=${c.lightmagenta}"
        "14=${c.lightcyan}"
        "15=${c.lightwhite}"
      ];
    };
  };
}
