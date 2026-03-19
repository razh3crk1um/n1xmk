{...}: {
  age = {
    identityPaths = ["/persist/etc/ssh/ssh_host_ed25519_key"];
    secrets."user-password" = {
      file = ../secrets/user-razh-password.age;
      #symlink = false;
      mode = "0400";
      owner = "root";
    };
    secrets."root-password" = {
      file = ../secrets/root-password.age;
      mode = "0400";
      owner = "root";
    };
  };
}
