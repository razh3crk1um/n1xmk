{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "razh3crk1um";
        email = "razh3crk1um@gmail.com";
      };
      alias = {
        ci = "commit";
        co = "checkout";
        st = "status";
      };
      init.defaultBranch = "main";
    };
  };
}
