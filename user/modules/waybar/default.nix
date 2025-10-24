{ pkgs, osConfig, ... }:
# { pkgs, hostConfig, ... }:
let
  waybar-config =
    if osConfig.networking.hostName == "derek" then
      builtins.readFile ./config-derek.jsonc
    else
      builtins.readFile ./config.jsonc;
  # waybar-config = builtins.readFile ./config.jsonc;
  #
  # customised =
  #   builtins.replaceStrings [ "at-translated-set-2-keyboard" ]
  #     [ "${hostConfig.keyboardType}" ]
  #     "${waybar-config}";
in
{
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar-config" = {
    enable = true;
    # source = ./config.jsonc;
    # text = "${customised}";
    text = "${waybar-config}";
    target = "waybar/config.jsonc";
  };

  xdg.configFile."waybar-css" = {
    enable = true;
    source = ./style.css;
    target = "waybar/style.css";
  };

  services.blueman-applet.enable = false;
}
