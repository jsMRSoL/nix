{ pkgs, ... }:
{
  programs.neovim.enable = true;

  # MyVim customization
  home.packages = with pkgs; [
    (callPackage ./myvim.nix {})
  ];
}
