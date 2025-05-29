{ pkgs, ... }:
let
  wlogout' = pkgs.wlogout.overrideAttrs (
    finalAttrs: prevAttrs: {
      postPatch =
        prevAttrs.postPatch
        + ''
          substituteInPlace layout \
            --replace-fail "loginctl lock-session" "swaylock"

          substituteInPlace layout \
            --replace-fail  "loginctl terminate-user \$USER" "hyprctl dispatch exit"
        '';
    }
  );
in
{

  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland

    settings = {
      monitor = [
        "eDP-1,1920x1080,0x0,1"
      ];

      exec-once = [
        "waybar"
        # "hyprpaper" is started by systemd - see components/hyprland.nix
        "dunst"
        "wl-paste -t text --watch clipman store --no-persist"
      ];

      "$terminal" = "foot";
      "$menu" = "wofi --insensitive --show drun";
      "$menu_term" = "foot -e wofi --insensitive --show run";
      # "$menu_term" = "wofi --insensitive --show run --term=foot";
      "$mainMod" = "SUPER";

      env = [
        "XCURSOR_SIZE,20"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "GTK_THEME,catppuccin-gtk"
      ];

      input = {
        kb_layout = "us,gr";
        kb_variant = ",polytonic";
        # kb_options = "grp:shifts_toggle";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 2;
        "col.active_border" = "rgba(f38ba8ff)";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "master";

        allow_tearing = false;
      };

      decoration = {
        rounding = 0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        # drop_shadow = "yes";
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      master = {
        new_status = "inherit";
        new_on_top = false;
        # no_gaps_when_only = true;
        inherit_fullscreen = true;
        mfact = 0.5;
      };

      dwindle = {
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      cursor = {
        hide_on_key_press = true;
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.96 0.9 1.0, class:.*"
        # "fakefullscreen, class:^(GIMP)"
        "float,class:(pavucontrol)"
        "size 50% 80%,class:(pavucontrol)"
        "float,class:(mpv)"
        "opacity 1.0,class:(mpv)"
        "size 75% 95%,class:(mpv)"
        "move 13% 4%,class:(mpv)"
        "float,class:(org.freedesktop.impl.portal.desktop.kde)"
        "size 75% 95%,class:(Sxiv)"
        "move 13% 4%,class:(Sxiv)"
        "opacity 1.0,class:(Sxiv)"
        "float,class:(xdg-desktop-portal-gtk),initialTitle:(.*)(save)"
        "opacity 1.0,class:(xdg-desktop-portal-gtk),initialTitle:(.*)(save)"
        "size 50% 60%,class:(xdg-desktop-portal-gtk),initialTitle:(.*)(save)"
        "fullscreenstate 0 2,class:(brave)"
        # no border if only window
        "noborder, onworkspace:w[tv1] f[-1], floating:0"
        "noborder, onworkspace:f[1], floating:0"
      ];

      bind = [
        "$mainMod, Delete, exec, systemctl suspend"
        "$mainMod_SHIFT, Delete, exec, systemctl poweroff"
        "$mainMod_SHIFT, Q, exec, wlogout -s"
        "$mainMod_SHIFT, S, exec, waylock"
        "$CTRL_SHIFT_ALT, Q, exit"
        "$mainMod_SHIFT, C, killactive,"
        "$mainMod, B, exec, pkill waybar || waybar &"
        "SHIFT, F2, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next"
        "SHIFT, F2, exec, hyprctl switchxkblayout usb-hid-keyboard next"

        # Program bindings
        "$mainMod_SHIFT, RETURN, exec, $terminal"
        "$mainMod, P, exec, $menu"
        "$mainMod_SHIFT, P, exec, $menu_term"
        "$CTRL_ALT, P, exec, mypassmenu"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, INSERT, exec, clipman pick -t wofi"
        "$mainMod, F8, exec, emacs &"
        "$SHIFT, F10, exec, hyprshot -m window"
        "$SHIFT_ALT, F10, exec, hyprshot -m region"

        # Layouts
        "$mainMod, F, togglefloating, "
        "$mainMod, P, pseudo" # dwindle
        "$mainMod, M, fullscreen, 1"

        # Orientations
        "$mainMod, T, layoutmsg, orientationleft"
        "$mainMod, U, layoutmsg, orientationtop"
        "$mainMod, SPACE, layoutmsg, orientationnext"

        # Move focus with mainMod + vim keys
        "$mainMod, H, movefocus, l"
        "$mainMod, J, layoutmsg, cyclenext"
        "$mainMod, K, layoutmsg, cycleprev"
        "$mainMod, L, movefocus, r"

        # toggle opacity
        # "$mainMod, O, toggleopaque"
        "$mainMod, O, exec, hyprctl setprop active opaque toggle"

        # Move windows
        "$mainMod_SHIFT, J, layoutmsg, swapnext"
        "$mainMod_SHIFT, K, layoutmsg, swapprev"
        "$mainMod, RETURN, layoutmsg, swapwithmaster"
        "$mainMod, I, layoutmsg, addmaster"
        "$mainMod, D, layoutmsg, removemaster"

        # Group windows (stacking)
        "$mainMod_SHIFT, T, togglegroup"
        "$mainMod, N, changegroupactive, f"
        "$mainMod_SHIFT, N, changegroupactive, b"

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

    extraConfig = ''
      bind = $mainMod, escape, submap, passthru

      submap = passthru
      bind = $mainMod, escape, submap, reset
      submap = reset
    '';

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = true;
      splash_offset = 0.2;
      # preload = [ "/home/simon/.nixos/assets/salty_mountains.png" ];
      # wallpaper = [ ",/home/simon/.nixos/assets/salty_mountains.png" ];
      preload = [
        "/home/simon/.nixos/assets/nixos-wallpaper-catppuccin-mocha.png"
      ];
      wallpaper = [
        ",/home/simon/.nixos/assets/nixos-wallpaper-catppuccin-mocha.png"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "swaylock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = "${./../../../assets/nix-wallpaper-binary-black.png}";
      color = "1e1e2e";
      font-size = 18;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "74c7ec";
      show-failed-attempts = true;
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    hyprshot
    swaylock
    waybar
    wlogout'
    xdg-desktop-portal-gtk
  ];

  home.sessionVariables = {
    HYPRSHOT_DIR = "/home/simon/Pictures/screenshots";
    # Optional, hint Electron apps to use Wayland:
    NIXOS_OZONE_WL = "1";
  };
}
