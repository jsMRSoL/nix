{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -g allow-passthrough on
      set -g status-position top
      set-option -g renumber-windows on
      unbind p
      bind-key p paste-buffer
      bind-key P choose-buffer
      bind-key + delete-buffer \; display-message "Deleted current Tmux Clipboard History"
      bind-key < run-shell "tmux set-buffer -- \"$(xsel -o -b)\"" \; display-message "Copy To Tmux Clipboard"
      bind-key > run-shell 'tmux show-buffer | xsel -i -b' \; display-message "Copy To System Clipboard"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi V send-keys -X select-line
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T choice-mode-vi h send-keys -X tree-collapse 
      bind-key -T choice-mode-vi l send-keys -X tree-expand 
      bind-key -T choice-mode-vi H send-keys -X tree-collapse-all 
      bind-key -T choice-mode-vi L send-keys -X tree-expand-all 
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe "xclip -in -selection clipboard"
      bind-key -T copy-mode-vi y send-keys -X copy-pipe "xclip -in -selection clipboard"
      bind-key b set -g status
      bind-key m display-message 'Test message'
      bind-key C-c capture-pane \; save-buffer /tmp/tmux-buffer \; new-window -n "urlview" 'cat /tmp/tmux-buffer | urlview && tmux kill-window'
      bind-key C-y display-popup -w 40% -h 30% -T "tmux-menu" -E "menu.tmx"
      bind-key v display-popup -w 40% -E "tmux-editing-session"
      bind-key C-v display-popup -w 40% -E "tmux-myvim"
      bind-key C-u display-popup -w 40% -E 'read -p "Enter new detached session name: " session && tmux new-session -s $session -d'
      bind-key C-p display-popup -w 60% -h 100% -E 'read -p "Search for: " query && query="$(echo "$query" | sed "s| |%20|g")" && w3m https://lite.duckduckgo.com/lite?q="$query"'
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
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_tabs_enabled 'off'
          set -g @catppuccin_status_modules_right 'session directory date_time'
          set -g @catppuccin_datetime_icon ""
          set -g @catppuccin_date_time "%d-%m-%Y %H:%M"
          set -g @catppuccin_directory "off"
        '';
      }
    ];
    prefix = "C-b";
    sensibleOnTop = true;
    terminal = "tmux-256color";
  };
}
