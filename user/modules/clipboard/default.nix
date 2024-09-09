{
  services.clipman.enable = true;

  xdg.configFile."wofi" = {
    enable = true;
    source = ./wofi;
    target = "wofi";
  };
}
