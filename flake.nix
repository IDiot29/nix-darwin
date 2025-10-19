{
  description = "My Nix Darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    
    # Homebrew taps
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask }:
  {
    darwinConfigurations."Rivaldos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        # macOS system configuration
        {
          # Nix settings
          nix = {
            enable = false;
            settings = {
              experimental-features = "nix-command flakes";
            };
          };

          # Platform
          nixpkgs.hostPlatform = "aarch64-darwin";
          
          # System settings
          system = {
            primaryUser = "rivaldo";
            stateVersion = 6;
            configurationRevision = self.rev or self.dirtyRev or null;
            
            defaults = {
              dock = {
                autohide = true;
                mru-spaces = false;
              };
              
              finder = {
                AppleShowAllExtensions = true;
                FXPreferredViewStyle = "clmv";
              };
              
              screencapture = {
                location = "~/Pictures/screenshots";
              };
              
              screensaver = {
                askForPasswordDelay = 10;
              };
            };
          };
        }
        
        # System-level configs
        ./darwin/homebrew.nix
        ./darwin/fish.nix

	# Services
	services.yabai = {
	  enable = true;
	};
        
        # nix-homebrew (manages Homebrew installation)
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "rivaldo";
            enableRosetta = true;
            autoMigrate = false;  # Disabled to avoid migration conflicts

            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            mutableTaps = true;  # Allow existing taps to be managed manually
          };
        }
        
        # home-manager (manages user-level: packages, programs, configs)
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.rivaldo = import ./home-manager/home.nix;
          };
        }
      ];
    };
  };
}
