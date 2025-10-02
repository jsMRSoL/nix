{
  description = "Go CLI app with devShell, tests, and reproducible Nix build";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fake = nixpkgs.lib.fakeHash;
      thisApp = "gohello";
    in
    {
      # 1. Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.go
          pkgs.gopls
          pkgs.delve
          pkgs.air
          pkgs.impl
          pkgs.gomodifytags
          pkgs.iferr
          pkgs.golines
          pkgs.gotests
          pkgs.gotestsum
        ];

        # Make everything project-local
        shellHook = ''
          # Ensure Go cache directory exists
          if [ ! -d .go ]; then
            mkdir .go
            echo "# ignore everything in this directory" > .go/.gitignore
            echo "*" >> .go/.gitignore
          fi
          export GOPATH="$PWD/.go"
          export GOMODCACHE="$GOPATH/pkg/mod"
          export PATH="$GOPATH/bin:$PATH"
          echo
          echo "  🦫  Welcome to your Go dev shell!"
          echo
          echo "  Available commands:"
          echo "  🧱  go mod init <module> → initialize a new Go module"
          echo "  🧹  go mod tidy          → clean and update go.mod + go.sum"
          echo "  🛠️  go build             → build the project"
          echo "  ▶️  go run <file>        → run a Go source file"
          echo "  ✅  go test ./...        → run all tests"
          echo "  🔄  air                  → auto-run on changes"
          echo
        '';
      };

      # 2. Build the Go application with Nix
      packages.${system} = {
        ${thisApp} = pkgs.buildGoModule {
          pname = thisApp;
          version = "0.1.0";

          # Path to your project
          src = ./.;

          # Try this first
          vendorHash = fake;
          proxyVendor = true;

          # Run go test during build:
          # doCheck = true;
        };

        default = self.packages.${system}.${thisApp};
      };
    };
}
