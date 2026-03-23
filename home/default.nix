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
        mpv
        mpc
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

        #pciutils
        #usbutils

        #xray
        #sing-box
        #v2rayn
        #v2ray-geoip
        #v2ray-domain-list-community
      ]
      ++ (builtins.attrValues scripts);
  };

  programs.home-manager.enable = true;

  imports = [
    ./zsh
    ./xorg
    ./niri
    ./waybar
    ./vim
    ./alacritty
    ./ghostty
    ./tmux
    ./mako
    ./yazi
    ./mpd
    ./rmpc
    ./ncmpcpp
    ./fuzzel
    ./fcitx
    ./firefox
    ./hypridle
    ./cava
    ./misc

    #./ranger
    #./zellij
    #./hypr
  ];
}
