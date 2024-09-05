{ pkgs, ... }:
{
  programs.neovim.enable = true;

  # MyVim customization
  home.packages = with pkgs; [
    (callPackage ./myvim.nix {})
  ];

  xdg.configFile."MyVim" = {
    enable = true;
    source = ./MyVim;
    target = "MyVim";
  };
}
