{
  description = "My first nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mypassmenu = {
      url = "github:jsMRSoL/mypassmenu";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pistolConfig = {
        termFontSize = "16";
        keyboardType = "at-translated-set-2-keyboard";
      };

      rapierConfig = {
        termFontSize = "16";
        keyboardType = "at-translated-set-2-keyboard";
      };

      vivConfig = {
        termFontSize = "16";
        keyboardType = "at-translated-set-2-keyboard";
      };

      derekConfig = {
        termFontSize = "14";
        keyboardType = "at-translated-set-2-keyboard";
      };

      swingConfig = {
        termFontSize = "12";
        keyboardType = "at-translated-set-2-keyboard";
      };

      swingvmConfig = {
        termFontSize = "12";
        keyboardType = "at-translated-set-2-keyboard";
      };

    in
    {
      nixosConfigurations = {

        pistol = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/pistol/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-pistol.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = pistolConfig;
              };
            }
          ];
        };

        rapier = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/rapier/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-rapier.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = rapierConfig;
              };
            }
          ];
        };

        swing = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/swing/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-swing.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = swingConfig;
              };
            }
          ];
        };

        swingvm = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/swingvm/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-swing.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = swingvmConfig;
              };
            }
          ];
        };

        viv = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/viv/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-viv.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = vivConfig;
              };
            }
          ];
        };

        derek = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/hosts/derek/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./user/profiles/simon-derek.nix;
              home-manager.extraSpecialArgs = {
                hostConfig = derekConfig;
              };
            }
          ];
        };
      };
    };
}
