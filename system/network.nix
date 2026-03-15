{
  pkgs,
  inputs,
  ...
}: {
  # cache mirrors list
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];

    connect-timeout = 5;
  };

  programs.ssh.startAgent = true;

  # network & base pkgs
  networking = {
    hostName = "m1uq0m5-n1xmk";
    #nameservers = [ "127.0.0.1" "::1" ];
    #nameservers = ["127.0.0.1"];
    nameservers = ["1.1.1.1" "223.5.5.5"];
    enableIPv6 = false;

    networkmanager = {
      enable = true;
      dns = "none";
    };
    #resolvconf.enable = false;

    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];

      checkReversePath = false; # 允许非对称路由（核心，防止卡死）
      trustedInterfaces = ["Mihomo"];

      logRefusedConnections = true;
      rejectPackets = true;
    };
  };

  # dnscrypt
  services.dnscrypt-proxy = {
    enable = false;
    settings = {
      server_names = ["cloudflare" "google"];
      listen_addresses = ["127.0.0.1:53"];
    };
  };

  services.resolved.enable = false;

  # proxy
  boot.kernelModules = ["tun"];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  programs.clash-verge = {
    #package = pkgs.clash-verge-rev;
    package = inputs.nixpkgs-tun-fix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.clash-verge-rev;
    enable = true;

    tunMode = true;
    serviceMode = true;
    #autoStart = true;
  };
}
