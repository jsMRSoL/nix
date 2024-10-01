{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland

    settings = {
      exec-once = [
          "waybar"
          "hyprpaper"
          "dunst"
          "wl-paste -t text --watch clipman store --no-persist"
        ]

      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";
      "$menu_term" = "wofi --show run";
      "$mainMod" = "SUPER";
      "env" = "XCURSOR_SIZE,24";
      "env" = "QT_QPA_PLATFORMTHEME,qt5ct";

      input = {
        kb_layout = "us";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" =  "rgba(f38ba8ff)";
        "col.inactive_border" = "rgba(595959aa)";

        layout = master;
        no_cursor_warps = true;

        allow_tearing = false;
      };

      decoration = {
          rounding = 0;
          blur = {
              enabled = true;
              size = 3;
              passes = 1;
          };
          drop_shadow = "yes";
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
          enabled = "yes";

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = "windows, 1, 7, myBezier";
          animation = "windowsOut, 1, 7, default, popin 80%";
          animation = "border, 1, 10, default";
          animation = "borderangle, 1, 8, default";
          animation = "fade, 1, 7, default";
          animation = "workspaces, 1, 6, default";
      };

      master = {
          new_is_master = true;
          new_on_top = true;
          no_gaps_when_only = true;
          inherit_fullscreen = false;
      };

      dwindle = {
          pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = "yes"; # you probably want this
      };

      gestures = {
          workspace_swipe = "off";
      };

      misc {
          force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.96 0.9 1.0, class:.*"
        "fakefullscreen, class:^(GIMP)"
        "float,class:(pavucontrol)"
        "float,class:(mpv)"
        "opacity 1.0,class:(mpv)"
        "size 75% 95%,class:(mpv)"
        "move 13% 4%,class:(mpv)"
        "float,class:(org.freedesktop.impl.portal.desktop.kde)"
        "size 75% 95%,class:(Sxiv)"
        "move 13% 4%,class:(Sxiv)"
        "opacity 1.0,class:(Sxiv)"
      ];

      bind =
        [
          "$mainMod, Delete, exec, systemctl suspend"
          "$mainMod_SHIFT, Delete, exec, systemctl poweroff"
          "$mainMod_SHIFT, Q, exec, wlogout -s"
          "$mainMod_SHIFT, S, exec, waylock"
          "$CTRL_SHIFT_ALT, Q, exit"
          "$mainMod_SHIFT, C, killactive,"
          "$mainMod, B, exec, killall waybar || waybar &"

          # Program bindings
          "$mainMod_SHIFT, RETURN, exec, $terminal"
          "$mainMod, P, exec, $menu"
          "$mainMod_SHIFT, P, exec, $menu_term"
          "$CTRL_ALT, P, exec, mypassmenu"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, INSERT, exec, clipman pick -t wofi"
          "$mainMod, F8, exec, emacs &"

          # Layouts
          "$mainMod, F, togglefloating, "
          "$mainMod, P, pseudo" # dwindle
          "$mainMod, M, fullscreen, 1"

          # Orientations
          "$mainMod, T, layoutmsg, orientationleft"
          "$mainMod, H, layoutmsg, orientationtop"
          "$mainMod, SPACE, layoutmsg, orientationnext"

          # Move focus with mainMod + vim keys
          "$mainMod, Left, movefocus, l"
          "$mainMod, J, layoutmsg, cyclenext"
          "$mainMod, K, layoutmsg, cycleprev"
          "$mainMod, Right, movefocus, r"

          # toggle opacity
          "$mainMod, O, toggleopaque"

          # Move windows
          "$mainMod_SHIFT, J, layoutmsg, swapnext"
          "$mainMod_SHIFT, K, layoutmsg, swapprev"
          "$mainMod, RETURN, layoutmsg, swapwithmaster"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
    };

    systemd = {
      enable = true;
      variables = ["--all"];
    };

  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = true;
      preload = [ ../../../assets/salty_mountains.png ];
      wallpaper = [ ",${../../../assets/salty_mountains.png}" ];
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    waybar
    wlogout
    waylock
  ];

  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
