# Home Manager configuration for macOS
{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./packages.nix
    ./starship.nix
    ./bat.nix
    ./zoxide.nix
    ./atuin.nix
    ./tmux.nix
  ];

  # Home directory
  home.homeDirectory = lib.mkForce "/Users/rivaldo";

  # Programs
  programs.home-manager.enable = true;

  # State version
  home.stateVersion = "24.05";
}
