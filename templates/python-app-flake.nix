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
          pkgs.python3Packages.pytest
          pkgs.python3Packages.pytest-cov
          # libffi
          # openssl
          # zlib
        ];

        shellHook = ''
          export UV_CACHE_DIR="$PWD/.uv-cache"
          if [ ! -d ./.venv ]; then
            echo "  📦 Created virtualenv at ./.venv."
            uv venv
          fi
          source ./.venv/bin/activate
          echo
          echo "  🐍 Welcome to your Python dev shell!"
          echo
          echo "  Available commands:"
          echo "  🧱 uv init                           → initialise a new project"
          echo "  📦 uv add <package>                  → install a dependency"
          echo "  🗑️ uv remove <package>               → remove a dependency"
          echo "  ⚡ uv pip install -r pyproject.toml  → install all dependencies"
          echo "  🧹 uv cache clean                    → remove installed packages"
          echo "  ▶️ uv run <file>                     → run py file"
          echo "  🧪 uv run pytest                     → run tests using pytest"
          echo "  🔧 deps2nix                          → extract dependencies for propagatedBuildInputs"
          echo
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
