{

  imports = [
    ../modules/cmdline
    ../modules/atuin
    ../modules/bash
    ../modules/browser
    # ../modules/clipboard
    ../modules/dunst
    ../modules/foot
    ../modules/games
    ../modules/git
    ../modules/gui
    ../modules/languages
    ../modules/nixvim
    ../modules/sway
    ../modules/tmux
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
