{ pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.obsidian
    pkgs.zotero
  ];
}
