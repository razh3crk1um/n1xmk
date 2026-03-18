{
  pkgs,
  config,
  ...
}: {
  xdg.configFile."ranger/scope.sh" = {
    source = "${pkgs.ranger}/share/doc/ranger/config/scope.sh";
    executable = true; # important
  };

  programs.ranger = {
    enable = true;

    settings = {
      #preview_images_method = "ueberzug";
      preview_images_method = "kitty";

      viewmode = "miller";
      column_ratios = "1,3,4";
      show_hidden = true;
      confirm_on_delete = "multiple";
      #preview_script = "~/.config/ranger/scope.sh";
      preview_script = "${config.xdg.configHome}/ranger/scope.sh";
      use_preview_script = true;
      automatically_count_files = true;
      open_all_images = true;
      vcs_aware = true;
      vcs_backend_git = "enabled";
      vcs_backend_hg = "disabled";
      vcs_backend_bzr = "disabled";
      vcs_backend_svn = "disabled";
      vcs_msg_length = 50;
      preview_images = true;
      iterm2_font_width = 8;
      iterm2_font_height = 11;
      unicode_ellipsis = false;
      bidi_support = false;
      show_hidden_bookmarks = true;
      colorscheme = "default";
      preview_files = true;
      preview_directories = true;
      collapse_preview = true;
      wrap_plaintext_previews = false;
      save_console_history = true;
      status_bar_on_top = false;
      draw_progress_bar_in_status_bar = true;
      draw_borders = "none";
      dirname_in_tabs = false;
      mouse_enabled = true;
      display_size_in_main_column = true;
      display_size_in_status_bar = true;
      display_free_space_in_status_bar = true;
      display_tags_in_all_columns = true;
      update_title = false;
      update_tmux_title = true;
      shorten_title = 3;
      hostname_in_titlebar = true;
      tilde_in_titlebar = false;
      max_history_size = 20;
      max_console_history_size = 50;
      scroll_offset = 8;
      flushinput = true;
      padding_right = true;
      autosave_bookmarks = true;
      save_backtick_bookmark = true;
      autoupdate_cumulative_size = false;
      show_cursor = false;
      sort = "natural";
      sort_reverse = false;
      sort_case_insensitive = true;
      sort_directories_first = true;
      sort_unicode = false;
      xterm_alt_key = false;
      cd_bookmarks = true;
      cd_tab_case = "sensitive";
      cd_tab_fuzzy = false;
      preview_max_size = 0;
      hint_collapse_threshold = 10;
      show_selection_in_titlebar = true;
      idle_delay = 2000;
      metadata_deep_search = false;
      clear_filters_on_dir_change = false;
      line_numbers = false;
      relative_current_zero = false;
      one_indexed = false;
      save_tabs_on_exit = false;
      wrap_scroll = false;
      #global_inode_type_filter ="";
      freeze_files = false;
      size_in_bytes = false;
      nested_ranger_warning = true;
    };

    #aliases = {
    #  e = "edit";
    #  q = "quit";
    #  q! = "quit!";
    #  qa = "quitall";
    #  qa! = "quitall!";
    #  qall = "quitall";
    #  qall! = " quitall!";
    #  setl = "setlocal";
    #
    #  filter = "scout -prts";
    #  find = "scout -aets";
    #  mark = "scout -mr";
    #  unmark = "scout -Mr";
    #  search = "scout -rs";
    #  search_inc = "scout -rts";
    #  travel = "scout -aefklst";
    #};

    mappings = {
      W = "quitall";
      w = "quit";
      q = "display_log";
      Q = "taskview_open";
    };
  };
}
