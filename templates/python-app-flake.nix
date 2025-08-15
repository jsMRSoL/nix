{
  description = "Python app with uv devShell and reproducible Nix packaging";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # or unstable if preferred
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux"; # adjust for your platform
      pkgs = nixpkgs.legacyPackages.${system};
      thisApp = "myapp";
    in
    {
      # 1. Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python3
          pkgs.uv
          # libffi
          # openssl
          # zlib
        ];

        shellHook = ''
          export UV_CACHE_DIR="$PWD/.uv-cache"
          if [ ! -d ./.venv ]; then
            echo "📦 Created virtualenv at ./.venv."
            uv venv
          fi
          source ./.venv/bin/activate
          echo "🐍 Entered dev shell."
          echo "📜 Install deps with 'uv add <package>' (updates pyproject.toml)."
          echo "   or uv pip install -r pyproject.toml"
          echo "✨ When finished, run deps2nix to extract dependencies from"
          echo "   pyproject.toml for inclusion in propagatedBuildInputs."
        '';
      };

      # 2. Build the Python application with Nix
      packages.${system} = {
        ${thisApp} = pkgs.python3Packages.buildPythonApplication {
          pname = thisApp;
          version = "0.1.0";
          src = ./.;

          # Use pyproject.toml: needed for console-scripts
          pyproject = true;

          nativeBuildInputs = [
            pkgs.python3Packages.setuptools
            pkgs.python3Packages.wheel
          ];

          # Match these to what's in pyproject.toml
          propagatedBuildInputs = [
            pkgs.python3Packages.click # just an example
          ];

        };

        # Alias: nix build → builds the package
        default = self.packages.${system}.${thisApp};
      };
    };
}
