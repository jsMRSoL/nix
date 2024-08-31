{
  xdg.configFile."kglobalshortcutsrc" = {
    enable = true;
    source = ./kglobalshortcutsrc;
    target = "kglobalshortcutsrc";
  };

  xdg.configFile."kwinrc" = {
    enable = true;
    source = ./kwinrc
    target = "kwinrc";
  };

  xdg.configFile."kxkbrc" = {
    enable = true;
    source = ./kxkbrc;
    target = "kxkbrc";
  };
}
