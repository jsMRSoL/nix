{
  xdg.configFile."waybar-config" = {
    enable = true;
    source = ./config.jsonc;
    target = "waybar/config.jsonc";
  };

  xdg.configFile."waybar-css" = {
    enable = true;
    source = ./style.css;
    target = "waybar/style.css";
  };
}
