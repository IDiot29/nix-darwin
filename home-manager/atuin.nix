# Atuin - Shell history manager
{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableFishIntegration = false;  # Manually initialized in darwin/fish.nix
  };
}
