# User packages
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI Tools
    neovim
    bat
    btop
    pwgen
    zoxide
    yazi
    starship
    atuin
    gh
    #opencode

    
    # Kubernetes/DevOps
    kubectl
    fluxcd
    cilium-cli
    kustomize
    
    # Containers
    podman
    podman-compose
  ];
}
