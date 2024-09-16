{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["ignoreboth"];
    initExtra = ''
    set -o vi
    bind -m vi-command ".":insert-last-argument
    bind -m vi-command '"\e-":yank-nth-arg'
    bind -m vi-insert '"\e=":edit-and-execute-command'

    function r() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }

    function tmux_running() {
      if ! tmux run 2> /dev/null; then
        return 1
      fi
      # return true
      return 0
    }

    function tmux_attached() {
      attached="$(tmux list-sessions -F \
        '#{session_attached} #{session_name}' | grep ^1)"
      if [[ -n $attached ]]; then
        # return true
        return 0
      else
        return 1
      fi
    }

    function tmux_ready() {
      if tmux_running && tmux_attached; then
        return 0
      else
        exec "$TERM" -e tmux-sessionizer.sh home &
        for _i in {1..50}; do
          if tmux has-session -t home 2> /dev/null; then
            # good to go
            return 0
          fi
          sleep 0.1
        done
        return 1
      fi
    }

    tmux_window_exists() {
      exists="$(tmux list-windows -F \
        '#{session_attached} #{window_name}' | grep "$1")"
      if [[ -n $exists ]]; then
        return 0
      fi
      return 1
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
      gs = "git status";
      gl = "git log --all --graph --decorate";
      gac = "git add . && git commit -m ";
      glo = "git log --all --graph --decorate --oneline";
      gsh = "git show";
      gcm = "git commit --amend";
      gri = "git rebase --interactive";
      # r = "yazi"; Moved to function - see initExtra attribute.
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      rehome = "home-manager switch --flake ${flakeDir}";
      update = "nix flake update ${flakeDir}";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    };
    # sessionVariables = {
    #   EDITOR = "nvim";
    # };
  };

  home.sessionVariables = {
    XDG_SCREENSHOTS_DIR = "/home/simon/Pictures/screenshots";
    GOPATH = "/home/simon/.go";
  };

  home.file.inputrc = {
    target = ".inputrc";
    text = ''
      set show-mode-in-prompt on
      set vi-ins-mode-string "+"
      set vi-cmd-mode-string ":"
    '';
  };
}
