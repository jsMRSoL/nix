{
  description = "A basic flake for rust development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      myApp = "name";
      myBuildInputs = [
        # add library packages here
        # e.g. pkgs.glib
      ];
      myNativeBuildInputs = [
        pkgs.pkg-config
      ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.cargo
          pkgs.rustc
          pkgs.rustfmt
          pkgs.clippy
          pkgs.rust-analyzer
        ] ++ myBuildInputs;

        nativeBuildInputs = myNativeBuildInputs;

        env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

        shellHook = ''
          echo "🦀 Welcome to your Rust dev shell!"
          echo
          echo "Available commands:"
          echo "  cargo build       → build the project"
          echo "  cargo run         → run the project"
          echo "  cargo test        → run tests"
          echo
          echo "Environment:"
          echo "  RUST_SRC_PATH = $RUST_SRC_PATH"
          echo
          echo "Tip: use 'cargo watch -x run' to auto-run on changes if installed"
        '';
      };

      packages.${system} = {
        ${myApp} = pkgs.rustPlatform.buildRustPackage {
          name = myApp; # actual binary name seems to come from cargo.toml
          src = ./.;
          buildInputs = myBuildInputs;
          nativeBuildInputs = myNativeBuildInputs;
          cargoLock.lockFile = ./Cargo.lock;
        };

        default = self.packages.${system}.${myApp};
      };
    };
}
