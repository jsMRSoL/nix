{ pkgs, ... }:
{
  gtk.enable = true;

  gtk.theme.package = pkgs.catppuccin-gtk;
  gtk.theme.name = "catppuccin-gtk";

  qt = {
    enable = true;
    style = {
      name = "catppuccin-qt5ct";
      package = pkgs.catppuccin-qt5ct;
    };
  };
}
