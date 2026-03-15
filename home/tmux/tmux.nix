{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";

    #shortcut = "`"; # <ctrl-`>
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 5000;
    #newSession = true;

    mouse = true;
    keyMode = "vi";
    aggressiveResize = true;

    plugins = with pkgs.tmuxPlugins; [
      yank
      resurrect
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5'
        '';
      }
    ];

    extraConfig = ''
      set-option -g prefix M-,
      bind-key M-, send-prefix

      set -g renumber-windows     on
      setw -g allow-rename        off   # 禁止活动进程修改窗口名
      setw -g automatic-rename    on
      setw -q -g utf8             on
      set -g set-titles           on
      set -g display-time         1000
      set -g display-panes-time   10000

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind H resize-pane -L 10
      bind J resize-pane -D 5
      bind K resize-pane -U 5
      bind L resize-pane -R 10

      bind -n S-Left previous-window
      bind -n S-Right next-window
      bind-key -n C-S-Left swap-window -t -1
      bind-key -n C-S-Right swap-window -t +1

      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      unbind ,
      bind-key , previous-window

      unbind .
      bind-key . next-window

      unbind p
      bind-key p command-prompt -T target "move-window -t '%%'"

      unbind y
      bind-key y command-prompt -I "#W" "rename-window '%%'"

      unbind n
      bind-key n split-window -h
      bind-key N split-window -v

      bind m resize-pane -Z

      bind-key u copy-mode

      bind-key r source-file ~/.tmux.conf \; display-message "tmux.conf reloaded"


      setw -g monitor-activity    on
      set -g visual-activity      on

      set -g status               on
      set -g status-interval      5
      set-option -g status-justify left

      set -g status-bg colour0
      set -g status-fg colour7

      set -g pane-active-border-style fg=colour1,bg=default,bold
      set -g pane-border-style fg=colour8,bg=default

      setw -g synchronize-panes off

      set-option -g status-left-length 40
      set-option -g status-left '#[bg=colour0,fg=colour8][#[fg=colour3]#S#[fg=colour8]] > (#[fg=colour1]#(whoami)#[fg=colour8]) '

      # set -g status-right '#[fg=colour8](#[fg=colour10]#(hostname)#[fg=colour8]) - #[fg=colour8][#[fg=colour4]%R#[fg=colour8]]'
      # set -g status-right '#[fg=colour8](#[fg=colour10]#(hostname)#[fg=colour8]) - #[fg=colour8][#[fg=colour4]%Y-%m-%d %R#[fg=colour8]]'
      set -g status-right '#[fg=colour8]"#[fg=colour10]#(hostname)#[fg=colour8]" - #[fg=colour8][#[fg=colour4]%R %a %b-%d#[fg=colour8]]'

      set-window-option -g window-status-format '#[fg=colour8]#I:#[fg=colour8]#W'
      set-window-option -g window-status-current-format '#[bg=colour1]#[fg=colour0]#[fg=colour0,bold] #I*:#[fg=colour0]#W #[bg=colour0,fg=colour1]'
      # set-window-option -g window-status-current-format '#[bg=colour1]#[fg=colour0,bold] #I*:#[fg=colour0]#W '
      set -wg window-status-separator " "

    '';
  };
}
