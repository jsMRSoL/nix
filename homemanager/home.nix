{ config, pkgs, ...}: {

  imports = [
    ../modules/foot
    ../modules/bash
    ../modules/git
    ../modules/dwm-status
    ../modules/games
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
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
    ];
  };

  programs.home-manager.enable = true;

}
