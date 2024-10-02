{

  imports = [
    ../modules/cmdline
    ../modules/atuin
    ../modules/bash
    ../modules/browser
    ../modules/clipboard
    ../modules/dunst
    ../modules/emacs
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/gui
    ../modules/languages
    ../modules/neovim
    ../modules/sway
    ../modules/hyprland
    ../modules/syncthing
    ../modules/theme
    ../modules/tmux
    ../modules/tmux-scripts
    ../modules/yazi
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = [];
  };

  programs.home-manager.enable = true;

}
