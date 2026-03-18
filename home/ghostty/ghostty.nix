{dna, ...}: let
  c = dna.colors;
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

      font-family = dna.font.family;
      font-size = dna.font.size;
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
        "8=${c.bright_black}"
        "9=${c.bright_red}"
        "10=${c.bright_green}"
        "11=${c.bright_yellow}"
        "12=${c.bright_blue}"
        "13=${c.bright_magenta}"
        "14=${c.bright_cyan}"
        "15=${c.bright_white}"
      ];
    };
  };
}
