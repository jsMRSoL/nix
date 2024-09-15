{ pkgs, ... }:
{
  gtk.enable = true;

  gtk.theme.package = pkgs.catppuccin-gtk;
  gtk.theme.name = "catppuccin-gtk";
}
