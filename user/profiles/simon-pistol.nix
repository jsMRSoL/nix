{ config, pkgs, ... }:
{

  imports = [
    ../modules/cmdline
    ../modules/atuin
    ../modules/bash
    ../modules/browser
    ../modules/dunst
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/kde
    ../modules/scripts
    ../modules/yazi
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [ ];
  };

  programs.home-manager.enable = true;

}
