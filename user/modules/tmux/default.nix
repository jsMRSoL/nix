{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      unbind C-b
      set -g prefix C-Space
      set -g status-position top
      set -s copy-command wl-copy
      set -g base-index 1
      set -g renumber-windows on
      bind b set -g status
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R
      bind  | split-window -h -c "#{pane_current_path}"
      bind  % split-window -h -c "#{pane_current_path}"
      bind  _ split-window -h -c "#{pane_current_path}"
      bind  - split-window -v -c "#{pane_current_path}"
      bind 1 select-window -t @0
      bind 2 select-window -t @1
      bind 3 select-window -t @2
      bind 4 select-window -t @3
      bind 5 select-window -t @4
      bind 6 select-window -t @5
      bind -n M-h previous-window
      bind -n M-l next-window
      bind -n M-n switch-client -n
      bind -n M-p switch-client -p
      bind m display-message "Test works!"
      bind-key C-y display-popup -w 40% -h 30% -T "tmux-menu" -E "menu.tmx"
      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
      set -g @catppuccin_status_modules_right "date_time application user session host"
    '';
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
  };
}
