{ pkgs, ... }:
let
  dell-bios-fan-control = pkgs.callPackage ../../user/modules/dell-bios-fan-control/default.nix { };

  fansoff = pkgs.writeShellScriptBin "fansoff.sh" ''
    echo 60 > "$(find /sys/devices/ -name 'pwm1')"
    echo 60 > "$(find /sys/devices/ -name 'pwm2')"
  '';
  fanson = pkgs.writeShellScriptBin "fanson.sh" ''
    if [[ "$1" = "full" ]]; then
      echo "setting fans on full"
      power=200
    else
      echo "setting fans on low"
      power=70
    fi
    echo "$power" > "$(find /sys/devices/ -name 'pwm1')"
    echo "$power" > "$(find /sys/devices/ -name 'pwm2')"
  '';
in
{
  environment.systemPackages = [
    dell-bios-fan-control
    fansoff
    fanson
    pkgs.lm_sensors
  ];

  boot.extraModprobeConfig = ''
    options dell-smm-hwmon restricted=0 ignore_dmi=1 force=1
  '';

  boot.kernelModules = [ "dell-smm-hwmon" ];

  systemd.services.dell-bios-fan-control = {
    description = "Disables BIOS control of fans at boot";
    wants = [ "dell-bios-fan-control-resume.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${dell-bios-fan-control}/bin/dell-bios-fan-control 0";
      RemainAfterExit = true;
      ExecStop = "${dell-bios-fan-control}/bin/dell-bios-fan-control 1";
    };
  };

  systemd.services.dell-bios-fan-control-resume = {
    description = "Restart dell-bios-fan-control on resume.";
    after = [ "suspend.target" ];
    wants = [ "dell-bios-fan-control-resume.service" ];
    wantedBy = [ "suspend.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "/bin/sh -c 'sleep 30 && ${pkgs.systemd} --no-block
      restart dell-bios-fan-control.service'";
    };
  };

  systemd.services.lm_sensors = {
    description = "Initialize hardware monitoring sensors";
    wantedBy = [
      "multi-user.target"
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = ''
        ${pkgs.kmod}/bin/modprobe coretemp
        ${pkgs.lm_sensors}/bin/sensors -s
      '';
      ExecStop = "${pkgs.kmod}/bin/modprobe -r coretemp";
    };
  };

  systemd.services.fancontrol = {
    enable = true;
    description = "Fan control";
    after = [ "dell-bios-fan-control.service" ];
    wantedBy = [
      "multi-user.target"
    ];

    unitConfig = {
      Type = "oneshot";
    };

    serviceConfig = {
      ExecStart = ''
        /bin/sh -c "sleep 10 && ${fansoff}/bin/fansoff.sh"
      '';
    };
  };
}
