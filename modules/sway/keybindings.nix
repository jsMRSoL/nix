{ config, pkgs }:

let
  modifier = wayland.windowManager.sway.config.modifier;
  left = wayland.windowManager.sway.config.left;
  down = wayland.windowManager.sway.config.down;
  up = wayland.windowManager.sway.config.up;
  right = wayland.windowManager.sway.config.right;
  _ = pkgs.lib.getExe;
  term = wayland.windowManager.sway.config.term;
  menu = wayland.windowManager.sway.config.menu;
  # ocrScript = pkgs.writeShellScript "ocr.sh" ''
  #   ${_ pkgs.grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract} - - | ${wl-clipboard}/bin/wl-copy
  #   ${_ libnotify} "$(${wl-clipboard}/bin/wl-paste)"
  # '';
in
{
  # Core WM controls
  "${modifier}+Shift+Return" = "exec ${term}";
  "${modifier}+Shift+p" = "exec ${menu}";
  "${modifier}+Shift+c" = "kill";
  "${modifier}+r" = "resize";
  "${modifier}+Shift+r" = "reload";
  # "${modifier}+Shift+r" = "restart";
  "${modifier}+Shift+s" = "exec ${pkgs.swaylock}/bin/swaylock -f -c 000000";
  "${modifier}+q" = "exit";
  "${modifier}+Shift+Delete" = "exec ${pkgs.systemd}/bin/systemctl poweroff";
  
  # Movements
  "${modifier}+${left}" = "focus left";
  "${modifier}+${down}" = "focus down";
  "${modifier}+${up}" = "focus up";
  "${modifier}+${right}" = "focus right";
  
  "${modifier}+Shift+${left}" = "move left";
  "${modifier}+Shift+${down}" = "move down";
  "${modifier}+Shift+${up}" = "move up";
  "${modifier}+Shift+${right}" = "move right";

  # Workspaces
  # "${modifier}+1" = "workspace number 1";
  # "${modifier}+2" = "workspace number 2";
  # "${modifier}+3" = "workspace number 3";
  # "${modifier}+4" = "workspace number 4";
  # "${modifier}+5" = "workspace number 5";
  # "${modifier}+6" = "workspace number 6";
  # "${modifier}+7" = "workspace number 7";
  # "${modifier}+8" = "workspace number 8";
  # "${modifier}+9" = "workspace number 9";
  "${modifier}+0" = "workspace number 10";

  # "${modifier}+Shift+1" = "move container to workspace number 1";
  # "${modifier}+Shift+2" = "move container to workspace number 2";
  # "${modifier}+Shift+3" = "move container to workspace number 3";
  # "${modifier}+Shift+4" = "move container to workspace number 4";
  # "${modifier}+Shift+5" = "move container to workspace number 5";
  # "${modifier}+Shift+6" = "move container to workspace number 6";
  # "${modifier}+Shift+7" = "move container to workspace number 7";
  # "${modifier}+Shift+8" = "move container to workspace number 8";
  # "${modifier}+Shift+9" = "move container to workspace number 9";
  "${modifier}+Shift+0" = "move container to workspace number 10";

  # "${modifier}+Ctrl+${left}" = "move workspace to output left";
  # "${modifier}+Ctrl+${down}" = "move workspace to output down";
  # "${modifier}+Ctrl+${up}" = "move workspace to output up";
  # "${modifier}+Ctrl+${right}" = "move workspace to output right";

  # layouts
  "${modifier}+b" = "splith";
  "${modifier}+v" = "splitv";
  "${modifier}+m" = "fullscreen";
  "${modifier}+f" = "floating toggle";
  "${modifier}+s" = "layout stacking";
  "${modifier}+t" = "layout tabbed";
  "${modifier}+e" = "layout toggle split";
  "${modifier}+space" = "focus mode_toggle";
  "${modifier}+a" = "focus parent";

  # Scratchpads
  #"${modifier}+Shift+minus" = "move scratchpad";
  #"${modifier}+minus" = "scratchpad show";

  # Screenshots
  # save custom area
  Print = "exec ${pkgs.grimshot}/bin/grimshot save area";
  # save screen
  "${modifier}+Print" = "exec ${pkgs.grimshot}/bin/grimshot save output";
  # copy custom area to clipboard
  "Alt+Print" = "exec ${pkgs.grimshot}/bin/grimshot copy area";
  # copy screen to clipboard
  "${modifier}+Shift+Print" = "exec ${pkgs.grimshot}/bin/grimshot copy output";
  # Print = ''exec ${grim}/bin/grim -g "$(${slurp}/bin/slurp -d)" - | ${wl-clipboard}/bin/wl-copy -t image/png'';
  # "${modifier}+p" = ''exec /bin/sh -c "cat /home/gytis/notes | ${pkgs.g-rofi}/bin/rofi -dmenu | ${pkgs.findutils}/bin/xargs ${pkgs.wtype}/bin/wtype"'';
  # XF86AudioMute = "exec ${pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
  # XF86AudioPlay = "exec ${playerctl}/bin/playerctl play";
  # XF86AudioPause = "exec ${playerctl}/bin/playerctl pause";
  # XF86AudioNext = "exec ${playerctl}/bin/playerctl next";
  # XF86AudioPrev = "exec ${playerctl}/bin/playerctl prev";
  # XF86AudioRaiseVolume = "exec ${pulseaudio}/bin/pactl  set-sink-volume @DEFAULT_SINK@ +5%";
  # XF86AudioLowerVolume = "exec ${pulseaudio}/bin/pactl  set-sink-volume @DEFAULT_SINK@ -5%";
  # XF86MonBrightnessUp = "exec ${xorg.xbacklight} -inc 20";
  # XF86MonBrightnessDown = "exec ${xorg.xbacklight} -dec 20";

  # "${modifier}+o" = "exec ${ocrScript}";
  # "${modifier}+b" = "exec ${brave}/bin/brave";
  #"${modifier}+t" = ''[class="scratchterm"] scratchpad show, move position center'';
  #"${modifier}+b" = ''[class="scratchbrowser"] scratchpad show, move position center '';



  #"${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

  #"${modifier}+r" = "mode resize";
}
