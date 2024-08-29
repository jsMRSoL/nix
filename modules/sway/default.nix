{
  # enable sway window manager
  # programs.sway = {
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      window = {
        border = 2;
      };
      floating = {
        modifier = "Mod4";
        titlebar = false;
        border = 2;
      };
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.wmenu}/bin/wmenu-run -i -l 42";
    };
    keybindings = import ./keybindings.nix;
    modes.resize = {
      Escape = "mode default";
      Return = "mode default";
      "${down}" = "resize grow height 10 px or 10 ppt";
      "${left}" = "resize shrink width 10 px or 10 ppt";
      "${right}" = "resize grow width 10 px or 10 ppt";
      "${up}" = "resize shrink height 10 px or 10 ppt";
    };
    extraConfig = ''
      client.focused #89b4fa #89b4fa #000000
      output * bg /home/simon/Pictures/wallpapers/landscapes/salty_mountains.png stretch
      input "type:keyboard" {
          xkb_layout us
          xkb_options ctrl:nocaps
      }
    '';
    bars = [
      {
         position = "top";
         statusCommand = ''while date + '%Y-%m-d %X'; do sleep 1; done'';
         colors = {
           statusline = "#cdd6f4";
           background = "#1e1e2e";
           focusedWorkspace = {
             background = "#89b4fa";
             text = "#74c7ec";
             border = "#45475a";
           };
           inactiveWorkspace = {
             background = "#585b70      ";
             text = "#cdd6fa";
             border = "#89b4fa  ";
           };
         };
      }
    ];
    wrapperFeatures.gtk = true;
  };


  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; }
      { event = "resume"; command = ''swaymsg "output * power on"''; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; } 
      { timeout = 600; command = ''swaymsg "output * power off"''; }
      { timeout = 900; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}

