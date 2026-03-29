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
}
