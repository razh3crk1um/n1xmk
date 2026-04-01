{
  pkgs,
  config,
  dna,
  ...
}: {
  # debug backdoor
  #users.users.root.initialHashedPassword = "$y$j9T$gsK6pYXkB54eM0QPpDhOI.$MubliTo.8oEqwm4eyAnNAt3yDpclJSmn4w55elsUlw5";

  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = config.age.secrets."root-password".path;

  users.users."${dna.user}" = {
    isNormalUser = true;
    group = dna.user;
    description = dna.user;

    uid = 1000;
    shell = pkgs.zsh;
    extraGroups = ["users" "networkmanager" "wheel" "video" "audio" "render"];

    hashedPasswordFile = config.age.secrets."user-password".path;
  };
  users.groups."${dna.user}".gid = 1000;

  # vaultwarden
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/local/vaultwarden/backup";
    # in order to avoid having  ADMIN_TOKEN in the nix store it can be also set with the help of an environment file
    # be aware that this file must be created by hand (or via secrets management like sops)
    environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
    config = {
      DOMAIN = "https://m1uq0m5-n1xmk.taila60d4e.ts.net";
      SIGNUPS_ALLOWED = false;

      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };

  # /var/local/vaultwarden/backup
  systemd.tmpfiles.rules = [
    "d /var/local/vaultwarden/backup 0700 vaultwarden vaultwarden -"
  ];
}
