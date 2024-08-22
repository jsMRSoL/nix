{ config, pkgs, ...}: {
  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    stateVersion = "24.05";

    packages = with pkgs; [
      exiftool
      htop
      mediainfo
      mpv
      mupdf
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
    ];
  };

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["ignoreboth"];
    initExtra = ''
    eval "$(zoxide init bash)"
    '';
    shellAliases =
      let
        flakeDir = "~/.nixos/";
      in {
      go = "cd ~/Downloads";
      gc = "cd ~/.config";
      gd = "cd ~/Documents";
      gn = "cd ${flakeDir}";
      gp = "cd ~/Pictures";
      gv = "cd ~/Videos";
      r = "yazi";
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rehome = "home-manager switch --flake ${flakeDir}";
      update = "nix flake update ${flakeDir}";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "si_pitt@yahoo.com";
    userName = "Simon Pitt";
  };
}
