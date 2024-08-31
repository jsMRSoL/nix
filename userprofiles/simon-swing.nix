{ config, pkgs, ...}: {

  imports = [
    ../modules/cmdline
    ../modules/bash
    ../modules/dunst
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/sway/config.nix
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [];
  };

  programs.home-manager.enable = true;

}
