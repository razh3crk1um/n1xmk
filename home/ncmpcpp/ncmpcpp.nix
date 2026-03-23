{config, ...}: {
  programs.ncmpcpp = {
    enable = true;
    settings = {
      ncmpcpp_directory = "${config.xdg.configHome}/ncmpcpp";
      lyrics_directory = "${config.xdg.dataHome}/ncmpcpp";
      mpd_host = "localhost";
      mpd_port = 6600;

      visualizer_output_name = "Visualizer feed";
      visualizer_in_stereo = "yes";
      visualizer_type = "wave_filled";
      visualizer_look = "●┃";
      visualizer_color = "cyan, green, yellow, magenta, red";

      song_list_format = "\"  %f $R%D %l  \"";
      song_library_format = "\"{{%a - %t} (%b)}|{%f}\"";
      now_playing_prefix = "\"$b$2\"";
      now_playing_suffix = "\"$/b$9\"";
      playlist_display_mode = "classic";
      autocenter_mode = "yes";
      progressbar_look = "\"━━ \"";
      header_visibility = "no";
      statusbar_visibility = "yes";
      titles_visibility = "no";
      follow_now_playing_lyrics = "no";
      enable_window_title = "no";
      external_editor = "vim";

      colors_enabled = "yes";
      empty_tag_color = "red";
      header_window_color = "yellow";
      volume_color = "yellow";
      state_line_color = "red";
      state_flags_color = "yellow";
      main_window_color = "default";
      color1 = "red";
      color2 = "red";

      current_item_prefix = "\"❯$b\"";
      current_item_suffix = "\"$/r$(end) \"";
      progressbar_color = "black";
      progressbar_elapsed_color = "red";
      statusbar_color = "default";
      alternative_ui_separator_color = "magenta";
      current_item_inactive_column_prefix = "red";
      current_item_inactive_column_suffix = "red";
      window_border_color = "yellow";
      active_window_border = "magenta";
      execute_on_song_change = ''sh -c 'notify-send "$(mpc status | sed -n "s/^\[\(playing\)\].*/▶ 正在播放/p; s/^\[\(paused\)\].*/⏸ 已暂停/p")" "$(mpc current -f %file% | sed "s|.*/||; s/\.[^.]*$//")"' '';
      allow_for_physical_item_deletion = "yes";
      browser_sort_mode = "name";
    };
    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "n";
        command = "next_found_item";
      }
      {
        key = "N";
        command = "previous_found_item";
      }
    ];
  };
}
