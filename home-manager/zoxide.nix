# Zoxide configuration
{ config, pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = false;  # Manually initialized in darwin/fish.nix
  };
}
