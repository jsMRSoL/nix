{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pingus
    supertux
  ];
}
