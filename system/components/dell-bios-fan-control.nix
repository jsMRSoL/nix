{ pkgs, ... }:
let
  dell-bios-fan-control = pkgs.callPackage ../../user/modules/dell-bios-fan-control/default.nix { };
in
# i8kutils = pkgs.callPackage ../../user/modules/i8k/default.nix { };
{
  environment.systemPackages = [
    dell-bios-fan-control
    pkgs.lm_sensors
    pkgs.fan2go
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
      ExecStart = "sh -c 'sleep 30 && ${pkgs.systemd} --no-block
      restart dell-bios-fan-control.service'";
    };
  };

  systemd.services.fancontrol = {
    enable = true;
    description = "Fan control";
    wantedBy = [
      "multi-user.target"
      "graphical.target"
      "rescue.target"
    ];

    unitConfig = {
      Type = "simple";
    };

    serviceConfig = {
      ExecStart = "${pkgs.lm_sensors}/bin/fancontrol";
      Restart = "always";
    };
  };
}
