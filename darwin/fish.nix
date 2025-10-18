{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -gx TERM "xterm-256color"

      # Disable greeting
      set fish_greeting

      # Homebrew (fish-specific initialization)
      eval (/opt/homebrew/bin/brew shellenv fish)

      # Load secrets if file exists (not tracked in git)
      if test -f ~/.config/fish/secrets.fish
        source ~/.config/fish/secrets.fish
      end

      # Function to source bash-style .env files
      function envsource
        if test (count $argv) -eq 0; or test "$argv[1]" = "--help"
          echo "Usage: envsource <file>"
          echo ""
          echo "Source bash-style environment files in fish shell"
          echo ""
          echo "Example:"
          echo "  envsource .env"
          echo "  envsource /path/to/my-vars.env"
          echo ""
          echo "Supports formats:"
          echo "  KEY=value"
          echo "  export KEY=value"
          echo '  KEY="value"'
          echo "  KEY='value'"
          return 0
        end

        set -l envfile $argv[1]
        if not test -f $envfile
          echo "Error: File '$envfile' not found"
          return 1
        end

        for line in (cat $envfile | grep -v '^#' | grep -v '^$')
          set item (string split -m 1 '=' -- $line)
          set -l value (string trim --chars='\'"' -- $item[2])
          set -gx $item[1] $value
        end
        echo "Sourced $envfile"
      end

      # NVM function
      function nvm
        bash -c "source ~/.nvm/nvm.sh; nvm $argv"
      end

      # ASDF (from homebrew)
      if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
      end

      # Enable Zoxide
      zoxide init fish | source

      # Enable starship
      starship init fish | source

      # Enable atuin
      atuin init fish | sed "s/-k up/up/g" | source 
    '';

    shellAliases = {
      # System
      ll = "ls -la";
      vim = "nvim";
      nv = "nvim";

      # Git shortcuts
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph";

      # Zoxide
      cd = "z";

      # Nix Darwin
      rebuild = "darwin-rebuild switch --flake ~/.config/nix-darwin";
      update-flake = "cd ~/.config/nix-darwin && nix flake update";
    };
  };
}
