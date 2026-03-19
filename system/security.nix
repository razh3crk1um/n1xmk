{
  pkgs,
  config,
  ...
}: {
  # debug backdoor
  #users.users.root.initialHashedPassword = "$y$j9T$gsK6pYXkB54eM0QPpDhOI.$MubliTo.8oEqwm4eyAnNAt3yDpclJSmn4w55elsUlw5";

  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = config.age.secrets."root-password".path;

  users.users.razh3crk1um = {
    isNormalUser = true;
    group = "razh3crk1um";
    description = "razh3crk1um";

    uid = 1000;
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "video" "audio" "render"];

    hashedPasswordFile = config.age.secrets."user-password".path;
  };
  users.groups.razh3crk1um.gid = 1000;
}
