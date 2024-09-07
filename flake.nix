{
  description = "My first nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    mypassmenu = {
      url = "path:../Projects/shellscripts/mypassmenu";
    };

  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
  let
      system = "x86_64-linux";
  in {
      nixosConfigurations = {

        pistol = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/hosts/pistol/configuration.nix 
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-pistol.nix;
            }
          ];
        };

        rapier = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/hosts/rapier/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-rapier.nix;
            }
          ];
        };

        swing = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = inputs;
          modules = [
            ./system/hosts/swing/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-swing.nix;
              home-manager.extraSpecialArgs = { inherit nixvim; };
            }
          ];
        };

        swingvm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/hosts/swingvm/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-swing.nix;
            }
          ];
        };
      };
    };
}
