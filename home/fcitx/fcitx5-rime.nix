{ 
  config,
  ...
}:

{
  #xdg.configFile."fcitx5/rime/default.custom.yaml".text = ''
  #  patch:
  #    "menu/page_size": 7
  #    schema_list:
  #      - schema: double_pinyin_flypy
  #'';

  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      "menu/page_size": 7
      schema_list:
        - schema: double_pinyin_flypy
  '';

  home.file.".local/share/fcitx5/rime/double_pinyin_flypy.schema.yaml".source = ./double_pinyin_flypy.schema.yaml;

  home.file.".local/share/fcitx5/themes/spring-pink" = {
    source = ./spring-pink;
    recursive = true;
  };
  
  xdg.configFile."fcitx5/conf/classicui.conf" = {
    text = ''
      # Vertical Candidate List
      Vertical Candidate List=False
      # Use mouse wheel to go to prev or next page
      WheelForPaging=True
      # Font
      Font="Sans 14"
      # Menu Font
      MenuFont="Sans 14"
      # Tray Font
      TrayFont="Sans Bold 14"
      # Tray Label Outline Color
      TrayOutlineColor=#000000
      # Tray Label Text Color
      TrayTextColor=#ffffff
      # Prefer Text Icon
      PreferTextIcon=False
      # Show Layout Name In Icon
      ShowLayoutNameInIcon=True
      # Use input method language to display text
      UseInputMethodLanguageToDisplayText=True
      # Theme
      Theme=spring-pink
      # Theme=Simple-dark
      # Dark Theme
      DarkTheme=default-dark
      # Follow system light/dark color scheme
      UseDarkTheme=False
      # Follow system accent color if it is supported by theme and desktop
      UseAccentColor=True
      # Use Per Screen DPI on X11
      PerScreenDPI=False
      # Force font DPI on Wayland
      ForceWaylandDPI=0
      # Enable fractional scale under Wayland
      EnableFractionalScale=True
      
      # 按屏幕 DPI 使用
      PerScreenDPI=True
    '';
  };
}
