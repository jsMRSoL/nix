{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = builtins.readFile ./tmux.conf;
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
          # set -g @catppuccin_window_icon "❏" 🗖 1F5D6
          # set -g @catppuccin_left_separator "█"
          # set -g @catppuccin_right_separator "█"
          set -g @catppuccin_date_time "%d-%m-%Y %H:%M"
          set -g @catppuccin_directory "off"
          # set -g @catppuccin_user "off"
          # set -g @catppuccin_host "on"
        '';
      }
    ];
    prefix = "C-<space>";
    sensibleOnTop = true;
    terminal = "tmux-256color";
  };
}
