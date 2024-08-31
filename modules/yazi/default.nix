{
  programs.yazi.enable = true;

  xdg.configFile."yazi-configs" = {
    enable = true;
    source = ./yazi;
    target = "yazi";
  };
}
