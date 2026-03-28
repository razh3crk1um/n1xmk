{
  pkgs,
  config,
  ...
}: {
  programs.bash.historyFile = "${config.xdg.dataHome}/bash/.bash_history";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = false;
      setSessionVariables = false; # HM 26.05 compat

      download = "${config.home.homeDirectory}/spawn";
      documents = "${config.home.homeDirectory}/docsx";
      desktop = "${config.home.homeDirectory}/deskp";

      pictures = "${config.home.homeDirectory}/media/pictures";
      videos = "${config.home.homeDirectory}/media/videos";
      music = "${config.home.homeDirectory}/media/music";

      templates = "${config.home.homeDirectory}/deskp/template";
      publicShare = "${config.home.homeDirectory}/deskp/public";

      #extraConfig = {
      #  XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/strm/p1cs/caps";
      #};
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        # file manager
        "inode/directory" = ["pcmanfm.desktop"];

        # html
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/about" = ["firefox.desktop"];
        "x-scheme-handler/unknown" = ["firefox.desktop"];
      };
    };
  };

  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    NH_FLAKE = "$HOME/.n1xmk";
    EDITOR = "nvim";

    # colorful output
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
    LESS = "-g -i -M -R -S -w -F -X";

    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "dvorak";
    WEBKIT_DISABLE_COMPOSITING_MODE = "1";

    # fcitx5
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    QT_IM_MODULES = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GTK_IM_MODULE = ""; # firefox-fcitx5 blink

    # pfetch
    PF_INFO = "ascii title os kernel uptime pkgs wm memory";
  };

  gtk = {
    enable = true;
    gtk2.extraConfig = "gtk-im-module=\"fcitx\"";
    gtk3.extraConfig.gtk-im-module = "fcitx";
    gtk4 = {
      extraConfig.gtk-im-module = "fcitx";
      theme = null; # HM 26.05 compat
    };
  };
}
