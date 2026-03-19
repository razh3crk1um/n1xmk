{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    vim
    inputs.agenix.packages."x86_64-linux".default
    #inputs.nixpkgs-tun-fix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.clash-verge-rev
  ];

  programs = {
    # nix-ld
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        zstd
        stdenv.cc.cc
        curl
        openssl
        attr
        libssh
        bzip2
        libxml2
        acl
        libsodium
        util-linux
        xz
        systemd

        fuse3
        icu
        #nss
        #expat
      ];
    };

    # zsh
    zsh.enable = true;

    # steam
    steam.enable = true;
  };

  # font
  fonts.packages = with pkgs; [
    sarasa-gothic
    font-awesome
    nerd-fonts.hack
  ];
}
