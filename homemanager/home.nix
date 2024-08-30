{ config, pkgs, ...}: {

  imports = [
    ../modules/bash
    ../modules/dunst
    ../modules/dwm-status
    ../modules/foot
    ../modules/games
    ../modules/git
    # ../modules/sway/config.nix
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
      libnotify
      mediainfo
      mpv
      mupdf
      neovim
      papirus-icon-theme
      sway-contrib.grimshot
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
    ];

    file = {
      "testhomefile.txt" = {
         text = "hi there!";
      };
    };
  };

  programs.home-manager.enable = true;

}
