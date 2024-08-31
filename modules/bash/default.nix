{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["ignoreboth"];
    initExtra = ''
    function r() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
    eval "$(zoxide init bash)"
    [[ -f /home/$USER/.nix-profile/share/bash/bash-preexec.sh ]] && source /home/$USER/.nix-profile/share/bash/bash-preexec.sh
    eval "$(atuin init bash --disable-up-arrow)"
    '';
    shellAliases =
      let
        flakeDir = "~/.nixos/";
      in {
      gc = "cd ~/.config";
      gd = "cd ~/Documents";
      gj = "cd ~/Projects";
      gm = "cd ~/Music";
      gn = "cd ${flakeDir}";
      go = "cd ~/Downloads";
      gp = "cd ~/Pictures";
      gr = "cd ~/Repos";
      gt = "cd /tmp";
      gv = "cd ~/Videos";
      # r = "yazi"; Moved to function - see initExtra attribute.
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rehome = "home-manager switch --flake ${flakeDir}";
      update = "nix flake update ${flakeDir}";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  home.sessionVariables = {
    XDG_SCREENSHOTS_DIR = "/home/simon/Pictures/screenshots";
  };
}
