{ lib, ... }:
{

  imports = [
    ../modules/atuin
    ../modules/bash
    ../modules/browser
    ../modules/clipboard
    ../modules/cmdline
    ../modules/dunst
    ../modules/emacs
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/gui
    ../modules/hyprland
    ../modules/languages
    ../modules/neovim
    # ../modules/sway
    ../modules/syncthing
    ../modules/theme
    ../modules/tmux
    ../modules/tmux-scripts
    ../modules/waybar
    ../modules/yazi
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";
  };

  # gui_programs.handbrake.enable = lib.mkForce false;
  # gui_programs.insomnia.enable = lib.mkForce false;
  # gui_programs.mkvtoolnix.enable = lib.mkForce false;
  # gui_programs.simple-scan.enable = lib.mkForce false;
  # gui_programs.sqlitebrowser.enable = lib.mkForce false;
  # gui_programs.zed-editor.enable = lib.mkForce false;

  programs.home-manager.enable = true;
}
