{ pkgs, ...}:
{
  xdg.configFile."sway" = {
    enable = true;
    source = ./sway-config;
    target = "sway/config";
  };

  xdg.configFile."sway-background" = {
    enable = true;
    source = ../../../assets/salty_mountains.png;
    target = "backgrounds/salty_mountains.png";
  };

  home.packages = with pkgs; [
    swayrbar
    wofi
  ];
}
