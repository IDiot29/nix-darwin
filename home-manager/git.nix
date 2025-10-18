# Git configuration
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "vldo766hi";
    userEmail = "rivaldo.silalahi@lintasarta.co.id";
    
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
