{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_n1xmk";
        identitiesOnly = true;
      };

      "*" = {
        extraOptions = {
          ServerAliveInterval = "60";
        };
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "razh3crk1um";
        email = "razh3crk1um@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
