{ config, pkgs, ...}: {

  imports = [
    ../modules/atuin
    ../modules/bash
    ../modules/browser
    ../modules/cmdline
    ../modules/dunst
    ../modules/dwm-status
    ../modules/emacs
    ../modules/games
    ../modules/git
    ../modules/neovim
    ../modules/scripts
    ../modules/x11
    ../modules/yazi
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [];
  };

  programs.home-manager.enable = true;

}
