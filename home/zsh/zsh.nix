{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      ignoreDups = true;
      share = true;
    };

    setOptions = [
      "PROMPT_SUBST"
      "CLOBBER"
      "NO_CORRECT"
    ];

    prezto = {
      enable = true;
      color = true;

      pmodules = [
        "environment"
        "editor"
        "history"
        "history-substring-search"
        "directory"
        "utility"
        "completion"
        "autosuggestions"
        "syntax-highlighting"
        #"prompt"
        #"spectrum"
      ];

      editor = {
        keymap = "emacs";
        dotExpansion = true;
      };

      syntaxHighlighting = {
        pattern = {
          "rm*-rf*" = "fg=white,bold,bg=red";
        };

        highlighters = [
          "main"
          "brackets"
          "pattern"
          "line"
          "cursor"
          "root"
        ];
      };

      completions.ignoredHosts = [
        "0.0.0.0"
        "127.0.0.1"
      ];

      utility = {
        safeOps = false;
      };
    };

    initContent = ''
        ${builtins.readFile ./lgfs_prompt.sh}

      rn() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

        printf "<< $(date)\n$(${pkgs.pfetch}/bin/pfetch)" | ${pkgs.lolcat}/bin/lolcat
    '';
  };
}
