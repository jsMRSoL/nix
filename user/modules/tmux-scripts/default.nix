{ pkgs, ... }:
let
  menu-tmx = pkgs.writeShellScriptBin "menu.tmx" ''
    display_menu() {
      cat << EOF
    7. Switch
    6. New
    5. Detached
    4. List
    3. Kill
    2. Vim
    1. Editing
    EOF
    }

    mode="$(display_menu | ${pkgs.fzf}/bin/fzf)"

    case $mode in
      "7. Switch") tmux-sessionizer.sh ;;
      "6. New") read -rp "Enter new session name: " session \
        && tmux-sessionizer.sh "$session" ;;
      "5. Detached") read -rp "Enter new detached session name: " session \
        && tmux new-session -s "$session" -d ;;
      "4. List") tmux-list-sessions; echo -e "\n"; \
        read -rp "Press any key to continue..."  ;;
      "3. Kill") tmux-kill-session ;;
      "2. Vim") tmux-myvim ;;
      "1. Editing" ) tmux-editing-session ;;
      *) notify-send "Tmux menu" "No action taken";;
    esac
  '';

  sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer.sh" ''
    # Do we already know what session we want?
    if [[ $# -eq 1 ]]; then
      session="$1"
    fi

    # Do we want an already running session?
    if [[ -z $session ]]; then
      session=$(${pkgs.tmux}/bin/tmux list-sessions | cut -d: -f1 | ${pkgs.fzf}/bin/fzf --prompt='Pick session or C-c for new session: ')
    fi

    # If not, then pick a folder for a new session.
    if [[ -z $session ]]; then
      path=$(${pkgs.fd}/bin/fd --type d -HL . ~/ | ${pkgs.fzf}/bin/fzf --prompt="Pick folder or C-c to cancel: ")
      [[ -z $path ]] && exit 0
      session=$(basename "$path" | tr . _)
      # [[ -z $path ]] && path=$dir
    fi

    # Create the session if it doesn't exist...
    if ! ${pkgs.tmux}/bin/tmux has-session -t "$session" > /dev/null 2>&1; then
      ${pkgs.tmux}/bin/tmux new-session -s "$session" -d -c "$path"
    fi

    # ...and switch to it.
    if tmux_attached; then
      # whenever a client is attached, we switch with switch-client.
      # this method allows this script to be called (with an argument)
      # from dmenu.
      ${pkgs.tmux}/bin/tmux switch-client -t "$session"
    else
      # This needs to be run in a terminal, and tmux will start in that terminal.
      # tmux-sessionizer is used in the tmux_ready function.
      # Will this code ever be reached in practice?
      ${pkgs.tmux}/bin/tmux attach -t "$session"
    fi

    exit 0
  '';

in
{
  menu-tmx = menu-tmx;
  sessionizer = sessionizer;
}
