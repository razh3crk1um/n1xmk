{ 
  ...
}:

{
  programs.hyprlock = {
    enable = true;

    settings = {
        general = {
          disable_loading = true;
          hide_cursor = true;
          grace = 0;
          no_fade_in = true;
        };
    
        background = [
          {
            monitor = "";
            path = "screenshot";
            
            blur_passes = 2;
            blur_size = 4;
            brightness = 1.0;
            contrast = 1.0;
          }
        ];
    
        label = [
          {
            monitor = "";
            text = "$TIME";
            color = "rgb(1f75fe)";
            font_size = 96;
            font_family = "Hack Nerd Font Bold";
            position = "0, 410";
            halign = "center";
            valign = "center";
            
            # 给文字加一层极细的深色阴影，防止白底壁纸“吃掉”浅色文字
            shadow_passes = 1;
            shadow_size = 2;
            shadow_color = "rgba(0, 0, 0, 0.3)";
          }

          {
            monitor = "";
            text = "cmd[update:1000] echo \"$(date +\"%A, %d %B %Y\")\"";
            color = "rgb(1f75fe)";
            font_family = "Sarasa Mono CL SemiBold";
            font_size = 24;
            position = "0, 300";
            halign = "center";
            valign = "center";
            
            shadow_passes = 1;
            shadow_size = 2;
            shadow_color = "rgba(0, 0, 0, 0.3)";
          }

          {
            monitor = "";
            text = "$USER";
            color = "rgb(d7005f)";
            font_family = "Sarasa Mono CL SemiBold";
            font_size = 30;
            position = "0, -128";
            halign = "center";
            valign = "center";
          }


        ];
	image = {
    	  monitor = "";
    	  path = "${../../assets/wallpapers/square-red-highlands-brown-moutains.jpg}";
    	  size = 300;
    	  rounding = -1;
	  border_color = "rgb(d7005f)";

    	  position = "0, 80";
    	  halign = "center";
    	  valign = "center";
	};
    
        input-field = [
          {
            monitor = "";
            size = "350, 60";
            outline_thickness = 4;
            
            outer_color = "rgb(d7005f)"; 
            inner_color = "rgba(26, 26, 26, 0.8)";
            font_color = "rgb(255, 255, 255)";
    
            dots_size = 0.4;
            dots_spacing = 0.3;
            dots_center = true;
    
            check_color = "rgb(87ff00)";
            fail_color = "rgb(255, 0, 0)";
            
            fade_on_empty = true;
            placeholder_text = "<span foreground='##ffffff66'><i>Enter Password...</i></span>";
            
            position = "0, -250";
            halign = "center";
            valign = "center";
          }
        ];
      };
     };
}
