{ config, pkgs, ... }:
{
  programs.neovim.enable = true;

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    /home/simon/.nixos/user/modules/neovim/nvim;

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
    # nixd
    nixd
    nixfmt-rfc-style
    # python
    pyright # ? or pylsp
    uv
    ruff
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
