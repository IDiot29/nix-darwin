# Starship prompt
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = false;  # Manually initialized in darwin/fish.nix
  };
}
