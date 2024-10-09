{ osConfig, ... }:
let
  paths = {
    "derek" = ./derek-config.xml;
    "viv" = ./viv-config.xml;
    "swing" = ./swing-config.xml;
    "swingvm" = ./swingvm-config.xml;
  };

  lookup = attrs: key: default:
    if attrs ? "${key}" then attrs."${key}" else default;

  currentSystem = osConfig.networking.hostName;

  configPath = lookup paths currentSystem paths.swingvm;

in

{
  services.syncthing.enable = true;

  home.file."syncthing-config" = {
    enable = true;
    source = configPath;
    target = ".local/state/syncthing/config.xml";
  };
}
