{ pkgs, ... }:
{
  gtk.enable = true;

  gtk.theme.package = pkgs.catppuccin-gtk.override { variant = "mocha"; };
}
