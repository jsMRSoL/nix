{ pkgs, osConfig, ... }:
let
  keyboards = {
    "derek" = "usb-hid-keyboard";
    "viv" = "at-translated-set-2-keyboard";
    "swing" = "at-translated-set-2-keyboard";
    "swingvm" = "at-translated-set-2-keyboard";
  };

  lookup =
    attrs: key: default:
    if attrs ? "${key}" then attrs."${key}" else default;

  currentSystem = osConfig.networking.hostName;

  keyboard = lookup keyboards currentSystem keyboards.viv;

  waybar-config = builtins.readFile ./config.jsonc;

  customised =
    builtins.replaceStrings [ "at-translated-set-2-keyboard" ] [ "${keyboard}" ]
      "${waybar-config}";
in
{
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar-config" = {
    enable = true;
    # source = ./config.jsonc;
    text = "${customised}";
    target = "waybar/config.jsonc";
  };

  xdg.configFile."waybar-css" = {
    enable = true;
    source = ./style.css;
    target = "waybar/style.css";
  };
}
