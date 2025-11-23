# Homebrew configuration (managed by home-manager)
{ config, pkgs, ... }:

{
  # Homebrew packages
  homebrew = {
    enable = true;
    
    # Casks (GUI applications)
    casks = [
      "ghostty"
      "google-chrome"
      "iterm2"
      "keepassxc"
      "obs"
      "pritunl"
      "telegram"
      "vlc"
      "raycast"
    ];
    
    # Brews (CLI tools that need to be from brew)
    brews = [
      "nushell"
      "asdf"
      "wireguard-tools"
      "wireguard-go"
      "sops"
      "helm"
      "acli"
      "codex"
    ];
    
    # Taps (additional repositories)
    taps = [];
  };
}
