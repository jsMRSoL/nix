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
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./pistol/configuration.nix ];
        };
        rapier = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./rapier/configuration.nix ];
        };
      };

      homeConfigurations.simon = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
      };
    };
}
