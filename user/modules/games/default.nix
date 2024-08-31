{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    superTux
  ];
}
