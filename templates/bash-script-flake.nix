{
  description = "Shell script development environment with linting, formatting, and reproducible builds";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux"; # adjust if needed (aarch64-darwin, etc.)
      pkgs = nixpkgs.legacyPackages.${system};
      thisApp = "myscripts";
    in
    {
      # 1. Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.bashInteractive # modern bash for development
          pkgs.shellcheck # linter
          pkgs.shfmt # formatter
          pkgs.bats # testing framework
          pkgs.bashdb # debugger
        ];

        shellHook = ''
          echo
          echo "  🐚 Welcome to your Shell Script dev shell!"
          echo
          echo "  Available commands:"
          echo "  🔍 shellcheck <file>   → lint your scripts"
          echo "  🎨 shfmt -w <file>     → format your scripts"
          echo "  🧪 bats <tests.bats>   → run tests"
          echo "  🐛 bashdb <script.sh>  → debug your script step-by-step"
          echo
        '';
      };

      # 2. Package the shell scripts with Nix
      packages.${system} = {
        ${thisApp} = pkgs.stdenv.mkDerivation {
          pname = thisApp;
          version = "0.1.0";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            # install all .sh scripts in the repo into $out/bin
            for f in $(find . -maxdepth 1 -type f -name "*.sh"); do
              install -m755 "$f" "$out/bin/$(basename "$f" .sh)"
            done
          '';
        };

        # Alias: nix build → builds the package
        default = self.packages.${system}.${thisApp};
      };
    };
}
