{dna, ...}: let
  c = dna.colors;
  f = dna.font;
in {
  #xdg.configFile."waybar/style.css".source = ./style.css;
  programs.waybar = {
    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: "${f.semibold}", "${f.glyphs.free}", "${f.nerd}";
          font-size: ${toString f.size_md}px;
          min-height:0px;
          border:none;
      }

      @define-color color0     ${c.black};
      @define-color color1     ${c.red};
      @define-color color2     ${c.green};
      @define-color color3     ${c.yellow};
      @define-color color4     ${c.blue};
      @define-color color5     ${c.magenta};
      @define-color color6     ${c.cyan};
      @define-color color7     ${c.white};
      @define-color color8     ${c.bright_black};
      @define-color color9     ${c.bright_red};
      @define-color color10    ${c.bright_green};
      @define-color color11    ${c.bright_yellow};
      @define-color color12    ${c.bright_blue};
      @define-color color13    ${c.bright_magenta};
      @define-color color14    ${c.bright_cyan};
      @define-color color15    ${c.bright_white};

      @define-color active_bg  #292929;

      window#waybar {
          background-color: transparent;
          color: @color14;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          /*box-shadow: inset 0 -3px transparent;*/
          /* Avoid rounded borders under each button name */

          border:none;
          border-radius:0px;
          /*box-shadow: inset 0 -3px transparent; */

          /*background-color: @color0;*/
          /*background-color: transparent;*/
          /* padding:0 10 0 10; */
          /*position:static;*/
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inherit;
          text-shadow: inherit;
          border:none;
          transition: none;
      }

      #workspaces button {
        background-color: @color0;
        color: @color1;
        padding: 0px 0.6em;

        border-bottom: 2px solid @color1;
      }

      #workspaces button.empty {
          color: @color8;
      }

      #workspaces button:hover {
          background: @color1;
          color:@color0;
      }

      /*#workspaces button.focused {*/
      #workspaces button.active {
          color: @color14;
          background-color: @active_bg;
      }

      #workspaces button.urgent {
          color: @color0;
          background-color: @color1;
      }

      #custom-archlogo,
      #custom-nixlogo {
          font-family: ${f.nerd};
          font-size: ${toString f.size_md};
          background: @color0;
          color:@color4;
      }

      #custom-lu, #custom-ld, #custom-ru, #custom-rd {
          font-family: ${f.nerd};
          font-size: 20px;

          padding: 0px;
          margin: 0px;
          margin-top: -1px;
          margin-bottom: -1px;

          color: @color0;
      }

      #custom-lu, #custom-ld {
          box-shadow: inset 0 -2px 0 0 @color0;
      }

      #custom-ru, #custom-rd {
          box-shadow: inset 0 2px 0 0 @color0;
      }

      #custom-ar{
          color: @color8;
          background-color:@color0;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd {
          background-color: @color0;
          padding: 0 6px;
          color: @color7;

      }

      #window,
      #workspaces {
          font-style:normal;
          background-color:@color0;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      .modules-left > widget > label,
      .modules-center > widget > label,
      .modules-right > widget > label {
          margin: 0;
      }

      window#waybar.empty #window {
          min-width: 30px;
          /*padding: 0 10px;*/
      }

      #clock {
          color: @color4;
          border-top: 2px solid @color4;
      }

      #battery {
          color: @color6;
          border-top: 2px solid @color6;
      }

      /*
      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }
      */

      label:focus {
          background-color: @color0;
      }

      #cpu {
          color: @color11;
          border-top: 2px solid @color11;
      }

      #memory {
          color: @color3;
          border-top: 2px solid @color3;
      }

      #network {
          color: @color2;
          border-top: 2px solid @color2;
      }

      /*
      #network.disconnected {
          color: @color2;
      }
      */

      #pulseaudio,
      #wireplumber {
          color: @color5;
          border-top: 2px solid @color5;
      }

      #pulseaudio:hover,
      #wireplumber:hover {
          background-color: @color5;
          color: @color0;
      }

      #temperature {
          color: @color9;
          border-top: 2px solid @color9;
      }

      #temperature.critical {
          color: @color9;
      }

      #tray {
          color: #2980b9;
          border-top: 2px solid rgba(85, 85, 85, 0.8);
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #mpd {
          color: @color1;
          padding-top: 2px;
      }

      /*
      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }
      */

      #idle_inhibitor {
        color: @color1;
      }

      tooltip {
          background: rgba(27, 29, 30, 0.8);
          border: 1px solid rgba(85, 85, 85, 0.8);
      }
      tooltip label {
          color: @color15;
      }
    '';
  };
}
