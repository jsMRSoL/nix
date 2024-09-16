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

      # fuzzy cd and fancy ls -lh
      function c() {
        local dir
        dir="$( fd --type d -H -d 5 | fzf )"
        [[ -z $dir ]] && return
        # cd "$dir"
        # exa -l --icons
        yazi $dir
      }

      # fuzzy search for a file in the current directory and open it in $EDITOR.
      function f() {
        local file
        file="$(fd --type f -HL | fzf --preview='bat --color always {}')"
        [[ -z $file ]] && return

        cd "$(dirname $file)"
        # base="$(basename $file)"
        # echo $base
        # $EDITOR "$file"
        $EDITOR "$(basename $file)"
      }

      # fuzzy search for a file in the Projects directory and open it in $EDITOR.
      function j() {
        local file
        file="$(fd --type f -HL . '/home/simon/Projects' | fzf --preview='bat --color always {}')"
        [[ -z $file ]] && return

        cd "$(dirname $file)"
        $EDITOR "$file"
        cd ~/
      }

      # fuzzy search for a file in a directory under $HOME
      # narrowing by directory, and open it in $EDITOR.
      function ff() {
        local dir
        dir="$( fd --type d -H . -d 1 ~/ | fzf )"
        [[ -z $dir ]] && return

        local file
        file="$(fd --type f -HL . $dir | fzf --preview='bat --color always {}')"
        [[ -z $file ]] && return

        cd "$(dirname $file)"
        $EDITOR "$file"
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
