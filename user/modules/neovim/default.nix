{ config, pkgs, ... }:
{
  programs.neovim.enable = true;

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink /home/simon/.nixos/user/modules/neovim/nvim;

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    lua-language-server
    pyright
    shfmt
    shellcheck
  ];
}
