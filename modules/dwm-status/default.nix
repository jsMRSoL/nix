{ pkgs, ... }:
{
  services.dwm-status = {
    enable = true;
    package = pkgs.dwm-status;
    # order = [ "audio" "backlight" "battery" "network" "cpu_load" "time" ];
    extraConfig = {
      order =  [ "cpu_load" "audio" "battery" "backlight" "network" "time" ];
      separator =  " | ";
      audio =  {
        control =  "Master";
        mute =  "MUTE";
        template =  "S {VOL}%";
        icons =  [];
      };
      backlight =  {
        device =  "intel_backlight";
        fallback =  "acpi_video*";
        template =  "L {BL}%";
        icons =  [];
      };
      battery =  {
        charging =  "▲";
        discharging =  "▼";
        enable_notifier =  true;
        no_battery =  "NO BATT";
        notifier_critical =  10;
        notifier_levels =  [ 2 5 10 15 20 ];
        separator =  " · ";
        icons =  [];
      };
      cpu_load =  {
        template =  " {CL1} {CL5} {CL15}";
        update_interval =  20;
      };
      network =  {
        no_value =  "NA";
        template =  "{ESSID}";
      };
      time =  {
        format =  "%Y-%m-%d %H:%M:%S";
        update_seconds =  true;
      };
    };
  };

  xdg.configFile."systemd/user/dwm-status.service.d/override.conf".text = ''
    [Service]
    Restart=always
    RestartSec=10
  '';
}

