{
  lib,
  config,
  dna,
  ...
}: {
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];

    connect-timeout = 10;
  };

  # network
  services.resolved.enable = false;
  networking = {
    hostName = dna.host;
    nameservers = ["1.1.1.1" "223.5.5.5"];
    enableIPv6 = false;

    networkmanager = {
      enable = true;
      dns = "none";
    };

    # nftables
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22 443 53317]; # localsend-53317
      allowedUDPPorts = [config.services.tailscale.port];

      checkReversePath = false; # 允许非对称路由（核心，防止卡死）
      trustedInterfaces = ["Mihomo" "tailscale0"];

      logRefusedConnections = true;
      rejectPackets = true;
    };
  };

  # proxy
  boot.kernelModules = ["tun"];
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  # clash-verge
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
    autoStart = true;
  };

  # tailscale
  services.tailscale = {
    enable = true;
    permitCertUid = "caddy";
    extraUpFlags = [
      # manual execution may be required - sudo tailscale up --accept-dns=false
      "--accept-dns=false"
    ];
  };

  # Force tailscaled to use nftables (Critical for clean nftables-only systems)
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  # candy reverse proxy
  services.caddy = {
    enable = true;
    virtualHosts."${lib.removePrefix "https://" config.services.vaultwarden.config.DOMAIN}".extraConfig = ''
      encode zstd gzip

      reverse_proxy 127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT} {
          header_up X-Real-IP {remote_host}
      }
    '';
  };

  # # disable ipv6
  # boot.kernel.sysctl = {
  #  "net.ipv6.conf.all.disable_ipv6" = 1;
  #  "net.ipv6.conf.default.disable_ipv6" = 1;
  #  # "net.ipv6.conf.lo.disable_ipv6" = 1;
  #  # "net.ipv6.conf.wlo1.disable_ipv6" = 1; # necessary
  # };

  # # dnscrypt
  # services.dnscrypt-proxy = {
  #   enable = true;
  #   settings = {
  #     server_names = ["cloudflare" "google"];
  #     listen_addresses = ["127.0.0.1:53"];
  #   };
  # };
}
