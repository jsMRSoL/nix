{ config, pkgs, ...}: {

  imports = [
    ../modules/bash
    ../modules/dunst
    ../modules/dwm-status
    ../modules/foot
    ../modules/games
    ../modules/git
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [
      atuin
      bash-preexec
      exiftool
      htop
      imagemagick
      lazygit
      mediainfo
      mpv
      mupdf
      neovim
      sway-contrib.grimshot
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
    ];
  };

  programs.home-manager.enable = true;

}
