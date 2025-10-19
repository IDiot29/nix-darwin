# Yabai tiling window manager configuration
{ config, pkgs, ... }:

{
  services.yabai = {
    enable = true;

    config = {
      # Layout
      layout = "bsp";  # Binary space partitioning (tiling)

      # Window gaps
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      window_gap = 12;

      # Mouse support
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
      mouse_modifier = "cmd";
      mouse_action1 = "move";    # Cmd + left-click = move window
      mouse_action2 = "resize";  # Cmd + right-click = resize window
      mouse_drop_action = "swap";

      # Window appearance
      window_opacity = "off";
      window_border = "on";
      window_border_width = 2;
      active_window_border_color = "0xff7aa2f7";  
      normal_window_border_color = "0xff3b4261"; 

      # Window placement
      window_placement = "second_child";
      window_topmost = "off";
      window_shadow = "float";

      # Splits
      split_ratio = 0.50;
      auto_balance = "off";

      # External bar 
      # external_bar = "all:0:0";  # Uncomment when using SketchyBar
    };

    extraConfig = ''
      # Rules for specific apps
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^Activity Monitor$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Archive Utility$" manage=off
      yabai -m rule --add app="^App Store$" manage=off
      yabai -m rule --add app="^KeePassXC$" manage=off

      echo "yabai configuration loaded.."
    '';
  };
}
