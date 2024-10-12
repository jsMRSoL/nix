{ pkgs, hostConfig, ... }:
let
  waybar-config = builtins.readFile ./config.jsonc;

  customised =
    builtins.replaceStrings [ "at-translated-set-2-keyboard" ]
      [ "${hostConfig.keyboardType}" ]
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
