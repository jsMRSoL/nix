{ pkgs, config, ... }:
let 
  left = "h";
  down = "j";
  up = "k";
  right = "l";
in
{
  # enable sway window manager
  # programs.sway = {
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      window = {
        border = 2;
        titlebar = false;
      };
      floating = {
        modifier = "Mod4";
        titlebar = false;
        border = 2;
      };
      inherit left;
      inherit down;
      inherit up;
      inherit right;
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.wmenu}/bin/wmenu-run -i -l 42";
      bars = [
        {
           position = "top";
           fonts = {
             names = [ "FiraCode Nerd Font Mono Med" ];
             size = 11.0;
           };
           statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
           colors = {
             statusline = "#cdd6f4";
             background = "#1e1e2e";
             focusedWorkspace = {
               border = "#89b4fa";
               background = "#74c7ec";
               text = "#45475a";
             };
             inactiveWorkspace = {
               border = "#89b4fa";
               background = "#585b70      ";
               text = "#cdd6fa";
             };
           };
        }
      ];
      keybindings = import ./keybindings.nix { inherit config pkgs; };
      modes.resize = {
        Escape = "mode default";
        Return = "mode default";
        "${down}" = "resize grow height 10 px or 10 ppt";
        "${left}" = "resize shrink width 10 px or 10 ppt";
        "${right}" = "resize grow width 10 px or 10 ppt";
        "${up}" = "resize shrink height 10 px or 10 ppt";
      };
    };
    extraConfig = ''
      client.focused #89b4fa #89b4fa #000000
      output * bg "${../../assets/salty_mountains.png}" stretch
      input "type:keyboard" {
          xkb_layout us
          xkb_options ctrl:nocaps
      }
    '';
    wrapperFeatures.gtk = true;
  };


  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; }
      { event = "after-resume"; command = ''swaymsg "output * power on"''; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; } 
      { timeout = 600; command = ''swaymsg "output * power off"''; }
      { timeout = 900; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}

