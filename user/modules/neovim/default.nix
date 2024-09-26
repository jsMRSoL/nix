{ pkgs, ... }:
{
  programs.neovim.enable = true;

  home.packages = with pkgs; [
    # go packages
    gopls
    impl
    gomodifytags
    iferr
    golines # fixes long lines
    gotests # test generator
    gotestsum # test runner
    delve # debugger, bin is dlv
    # rust packages are installed via rustup
    lldb
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
  ];
}
