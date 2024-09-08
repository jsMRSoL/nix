{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g status-position top
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
    '';
    keyMode = "vi";
    mouse = true;
    newSession = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
      }
    ];
    sensibleOnTop = true;
    terminal = "tmux-256color";
  };
}
