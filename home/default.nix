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
        xrdb
        xdg-utils
        android-tools
        cryptsetup
        setxkbmap

        swaybg
        xwayland-satellite

        firefox
        vscodium
        obs-studio
        telegram-desktop
        gimp
        openutau
        blender
        bottles
        brave
        lx-music-desktop
        reaper
        #reaper-sws-extension
        #reaper-reapack-extension

        imv
        mpv
        mpc
        yt-dlp
        wl-clipboard
        cliphist
        libnotify
        zathura
        localsend
        wireplumber
        pulseaudio
        pavucontrol
        brightnessctl

        gcc
        cmake
        gnumake
        pkg-config
        go
        gopls
        rustup
        uv
        python3

        jq
        tree
        bat
        btop
        ncdu
        eza
        fzf
        ripgrep
        trash-cli

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
