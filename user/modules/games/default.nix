{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    pingus
    superTux
  ];
}
