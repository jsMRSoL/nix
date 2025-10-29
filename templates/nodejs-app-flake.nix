{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fake = nixpkgs.lib.fakeHash;
      thisApp = "nodeApp";
    in
    {
      # 1. Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.nodejs_20
          pkgs.nodePackages.pnpm
          pkgs.javascript-typescript-langserver
          pkgs.typescript-language-server
          pkgs.typescript
          pkgs.eslint 
          pkgs.prettierd
        ];

        # Make everything project-local
        shellHook = ''
          # Ensure Go cache directory exists
          if [ ! -d .pnpm-store ]; then
            mkdir .pnpm-store
            echo "* " > .pnpm-store/.gitignore
          fi
          export PNPM_HOME="$PWD/.pnpm-store"
          export PNPM_STORE_DIR="$PWD/.pnpm-store"
          export PATH="$PATH:$PNPM_HOME"
          echo
          echo "  🟦 Welcome to your Node.js dev shell!"
          echo
          echo "  Available commands:"
          echo "    📥  pnpm install          → install dependencies"
          echo "    ▶️  pnpm run <script>     → run a script from package.json"
          echo "    🧪  pnpm test             → run tests (if defined)"
          echo "    🧹  pnpm run clean        → clean build artifacts (if defined)"
          echo "    📦  pnpm add <package>    → add a dependency to package.json"
          echo "    🗑️  pnpm remove <package> → remove a dependency from package.json"
          echo "    ⚡  pnpm dev              → start the development server"
          echo
        '';
      };
      # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      #
      # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    };
}
