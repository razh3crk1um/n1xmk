{pkgs, ...}: {
  users.groups.razh3crk1um.gid = 1000;
  users.users.razh3crk1um = {
    isNormalUser = true;
    group = "razh3crk1um";
    hashedPasswordFile = "/persist/secrets/razh3crk1um-pswd";
    description = "angley";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "render"];
    uid = 1000;
    shell = pkgs.zsh;
  };
}
