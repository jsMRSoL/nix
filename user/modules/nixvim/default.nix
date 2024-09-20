{ pkgs, nixvim, ... }:

let
  system = "x86_64-linux";
  nixvimLib = nixvim.lib.${system};
  nixvim' = nixvim.legacyPackages.${system};
  nixvimModule = {
    inherit pkgs;
    module = import ./config;
  };
  nvim = nixvim'.makeNixvimWithModule nixvimModule;
in
{
  home.packages = with pkgs; [
    # go packages
    impl
    gomodifytags
    iferr
    golines # fixes long lines
    gotests # test generator
    gotestsum # test runner
    delve # debugger, bin is dlv
    # rust packages are installed via rustup
    # python
    pyright # ? or pylsp
    # python312Packages.debugpy
    # js / ts
    prettierd
    typescript # provides tsserver
    # lua
    lua-language-server
    # shell
    shfmt
    shellcheck
    beautysh
    bashdb
  ] ++ [ nvim ];
}
