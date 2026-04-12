{
  pkgs,
  dna,
  ...
}: let
  scripts = import ./scripts {inherit pkgs;};
in {
  home = {
    username = dna.user;
    homeDirectory = "/home/${dna.user}";
    stateVersion = "25.11";

    packages = with pkgs;
      [
        # --- desktop ---
        android-tools
        cryptsetup
        setxkbmap
        xdg-utils
        xrdb
        xwayland-satellite

        wl-clipboard
        cliphist
        libnotify
        wireplumber
        pulseaudio
        pavucontrol
        brightnessctl

        # --- monitor ---
        btop
        dig
        pcmanfm
        ncdu
        trash-cli
        tree

        # --- daily ---
        firefox
        vscodium
        telegram-desktop
        bottles
        localsend
        brave
        aria2
        yt-dlp

        # --- dev ---
        gcc
        cmake
        gnumake
        pkg-config
        go
        gopls
        rustup
        uv
        python3

        # --- media production ---
        imagemagick
        ffmpeg
        gimp
        obs-studio
        openutau
        blender
        reaper
        #reaper-sws-extension
        #reaper-reapack-extension

        # --- media viewer ---
        imv
        zathura
        lx-music-desktop

        # --- modern ---
        bat
        eza
        fzf
        ouch
        ripgrep
        jq

        # --- theme ---
        swaybg
        lolcat
        pfetch
        fastfetch
        rose-pine-cursor
        adwaita-icon-theme
      ]
      ++ (builtins.attrValues scripts);
  };

  programs.home-manager.enable = true;

  imports = [
    ./alacritty
    ./cava
    ./fcitx
    ./firefox
    ./fuzzel
    ./ghostty
    ./mako
    ./misc
    ./mpd
    ./mpv
    ./niri
    ./rmpc
    ./swayidle
    ./tmux
    ./vim
    ./waybar
    ./xorg
    ./yazi
    ./zsh
  ];
}
