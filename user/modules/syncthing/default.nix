{ osConfig, ... }:
let
  currentSystem = osConfig.networking.hostName;
  configPath = ./. + "/${currentSystem}-config.xml";
in
{
  services.syncthing.enable = true;

  home.file."syncthing-config" = {
    enable = true;
    source = configPath;
    target = ".local/state/syncthing/config.xml";
  };
}
