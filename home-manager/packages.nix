# User packages
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI Tools
    neovim
    bat
    btop
    fastfetch
    pwgen
    zoxide
    yazi
    starship
    watch
    atuin
    gh
    
    # Development
    go
    
    # Kubernetes/DevOps
    kubectl
    fluxcd
    cilium-cli
    kustomize
    
    # Containers
    podman
    podman-compose
    opencode
  ];
}
