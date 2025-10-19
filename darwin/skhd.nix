# skhd - Simple hotkey daemon configuration
{ config, pkgs, ... }:

{
  services.skhd = {
    enable = true;

    skhdConfig = ''
      # ################################################################ #
      # THE FOLLOWING IS AN EXPLANATION OF THE GRAMMAR THAT SKHD PARSES. #
      # FOR SIMPLE EXAMPLE MAPPINGS LOOK FURTHER DOWN THIS FILE..        #
      # ################################################################ #

      # Mod key: alt (option) = tiling WM standard (avoids macOS conflicts)
      # Note: "alt" = Option key, "cmd" = Command key

      # ============================================================================
      # WINDOW FOCUS (Navigate between windows)
      # ============================================================================
      # Focus window (Vim-style: h=left, j=down, k=up, l=right)
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # ============================================================================
      # WINDOW MOVEMENT (Move windows)
      # ============================================================================
      # Move window (similar to Niri's Mod+Shift+hjkl)
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # Warp window (change window position in tree)
      ctrl + alt - h : yabai -m window --warp west
      ctrl + alt - j : yabai -m window --warp south
      ctrl + alt - k : yabai -m window --warp north
      ctrl + alt - l : yabai -m window --warp east

      # ============================================================================
      # WINDOW RESIZE
      # ============================================================================
      # Resize windows (Mod+R then hjkl, like Niri's resize mode)
      # Note: This uses a mode-like approach - press Mod+r, then hjkl to resize
      shift + alt - r : yabai -m window --resize right:50:0 || yabai -m window --resize left:50:0
      shift + alt - e : yabai -m window --resize bottom:0:50 || yabai -m window --resize top:0:50

      # ============================================================================
      # WINDOW ACTIONS
      # ============================================================================
      # Close focused window (Mod+Q like Niri)
      alt - q : yabai -m window --close

      # Toggle window fullscreen (Mod+F)
      alt - f : yabai -m window --toggle zoom-fullscreen

      # Toggle window native fullscreen (Mod+Shift+F)
      shift + alt - f : yabai -m window --toggle native-fullscreen

      # Toggle window float (Mod+Shift+Space)
      shift + alt - space : yabai -m window --toggle float

      # Toggle split orientation (Mod+E for vertical/horizontal split)
      alt - e : yabai -m window --toggle split

      # Balance space (equalize window sizes)
      shift + alt - b : yabai -m space --balance

      # ============================================================================
      # APPLICATIONS (Launch apps)
      # ============================================================================
      # Terminal (Mod+Enter like Niri) - Using Ghostty
      alt - return : open -n -a "Ghostty"

      # Alternative: iTerm2
      # alt - return : open -n -a "iTerm"

      # Browser (Mod+B)
      alt - b : open -a "Google Chrome"

      # Finder (Mod+N)
      alt - n : open -a "Finder"

      # Spotlight (Mod+D like dmenu/launcher)
      alt - d : open -a "Spotlight"

      # ============================================================================
      # WORKSPACE/SPACE MANAGEMENT (Similar to Niri workspaces)
      # ============================================================================
      # Switch to space 1-9 (Mod+1-9)
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9

      # Move window to space 1-9 (Mod+Shift+1-9)
      shift + alt - 1 : yabai -m window --space 1
      shift + alt - 2 : yabai -m window --space 2
      shift + alt - 3 : yabai -m window --space 3
      shift + alt - 4 : yabai -m window --space 4
      shift + alt - 5 : yabai -m window --space 5
      shift + alt - 6 : yabai -m window --space 6
      shift + alt - 7 : yabai -m window --space 7
      shift + alt - 8 : yabai -m window --space 8
      shift + alt - 9 : yabai -m window --space 9

      # Create new space (desktop)
      ctrl + alt - n : yabai -m space --create

      # Destroy current space
      ctrl + alt - x : yabai -m space --destroy

      # Focus recent space
      alt - tab : yabai -m space --focus recent

      # Cycle through spaces
      alt - p : yabai -m space --focus prev
      alt - n : yabai -m space --focus next

      # ============================================================================
      # DISPLAY/MONITOR MANAGEMENT
      # ============================================================================
      # Focus display (monitor)
      ctrl + alt - 1 : yabai -m display --focus 1
      ctrl + alt - 2 : yabai -m display --focus 2
      ctrl + alt - 3 : yabai -m display --focus 3

      # Move window to display
      ctrl + shift + alt - 1 : yabai -m window --display 1
      ctrl + shift + alt - 2 : yabai -m window --display 2
      ctrl + shift + alt - 3 : yabai -m window --display 3

      # ============================================================================
      # LAYOUT MANAGEMENT
      # ============================================================================
      # Toggle layout (BSP <-> Float)
      shift + alt - t : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "float" else "bsp" end')

      # Rotate tree 90 degrees
      alt - r : yabai -m space --rotate 90

      # Mirror tree horizontally
      alt - x : yabai -m space --mirror x-axis

      # Mirror tree vertically
      alt - y : yabai -m space --mirror y-axis

      # ============================================================================
      # YABAI SERVICE MANAGEMENT
      # ============================================================================
      # Restart yabai
      ctrl + shift + alt - r : launchctl kickstart -k "gui/$(id -u)/org.nixos.yabai"

      # Stop yabai
      ctrl + shift + alt - q : brew services stop yabai

      # ============================================================================
      # SYSTEM
      # ============================================================================
      # Lock screen (Mod+Shift+Escape)
      shift + alt - escape : pmset displaysleepnow

      # Screenshot
      # cmd + shift - 3 : (macOS default - full screen)
      # cmd + shift - 4 : (macOS default - selection)
      # cmd + shift - 5 : (macOS default - screenshot menu)
    '';
  };
}
