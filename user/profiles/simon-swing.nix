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
    ../modules/languages
    ../modules/nixvim
    ../modules/office
    ../modules/sway
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
