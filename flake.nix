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
          modules = [ ./hosts/pistol/configuration.nix ];
        };
        rapier = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/rapier/configuration.nix ];
        };
        swing = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/swing/configuration.nix ];
        };
        swingvm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/swingvm/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.users.simon = ./homemanager/home.nix
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
