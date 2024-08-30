{
  description = "My first nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
      system = "x86_64-linux";
  in {
      nixosConfigurations = {
        pistol = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/pistol/configuration.nix 
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./userprofiles/simon-pistol.nix;
            }
          ];
        };
        rapier = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/rapier/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./userprofiles/simon-rapier.nix;
            }
          ];
        };
        swing = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ 
            ./hosts/swing/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./userprofiles/simon-swing.nix;
            }
          ];
        };
        swingvm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/swingvm/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./userprofiles/simon-swing.nix;
            }
          ];
        };
      };

      # homeConfigurations.simon = home-manager.lib.homeManagerConfiguration {
      #   pkgs = nixpkgs.legacyPackages.${system};
      #   modules = [ ./homemanager/home.nix ];
      # };
    };
}
