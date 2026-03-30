{ pkgs, ... }:
{

  imports = [
    ../modules/atuin
    ../modules/bash
    ../modules/clipboard
    ../modules/cmdline
    ../modules/dunst
    ../modules/emacs
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/hyprland
    ../modules/languages
    ../modules/neovim
    ../modules/scripts
    ../modules/syncthing
    ../modules/theme
    ../modules/tmux
    ../modules/tmux-scripts
    ../modules/waybar
    ../modules/whisper
    ../modules/yazi
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.blender
    pkgs.brave
    pkgs.ddcutil
    pkgs.handbrake
    pkgs.insomnia
    pkgs.mkvtoolnix
    pkgs.obsidian
    pkgs.simple-scan
    pkgs.sqlitebrowser
    pkgs.zed-editor
    pkgs.zotero
  ];
}
