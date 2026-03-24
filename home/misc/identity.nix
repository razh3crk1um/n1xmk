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
        addKeysToAgent = "yes";
      };

      "*" = {
        addKeysToAgent = "yes";
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

      alias = {
        amend = "commit --amend --no-edit";
        lg = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all";
      };
      init.defaultBranch = "main";
    };
  };
}
