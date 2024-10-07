{ pkgs, ... }:
let
  dell-bios-fan-control = pkgs.callPackage ../../user/modules/dell-bios-fan-control/default.nix { };
  i8kutils = pkgs.callPackage ../../user/modules/i8k/default.nix { };
in
{
  environment.systemPackages = [
    dell-bios-fan-control
    i8kutils
  ];

  boot.extraModprobeConfig = ''
    options dell-smm-hwmon restricted=0 force=1
  '';

  boot.kernelModules = [ "dell-smm-hwmon" ];

  systemd.services.dell-bios-fan-control = {
    description = "Disables BIOS control of fans at boot";
    before = [ "i8kmon.service" ];
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

  systemd.services.i8kmon = {
    description = "Dell laptop thermal monitoring";
    wantedBy = [ "multi-user.target" ];
    unitConfig = {
      ConditionPathExists = "/proc/i8k";
    };

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.i8kutils}/bin/i8kmon --nouserconfig";
    };
  };
}
# [Unit]
# Description=Dell laptop thermal monitoring
# Documentation=man:i8kmon
# ConditionPathExists=/proc/i8k
#
# [Service]
# ExecStart=/usr/bin/i8kmon --nouserconfig
# Restart=always
# RestartSec=5
#
# [Install]
# WantedBy=multi-user.target
