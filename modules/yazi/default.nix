{
  programs.yazi = {
    enable = true;
    plugins = {
      docx = ./yazi/plugins/docx.yazi;
      doc = ./yazi/plugins/doc.yazi;
      odt = ./yazi/plugins/odt.yazi;
      xlsx = ./yazi/plugins/xlsx.yazi;
    };
  };

  xdg.configFile."yazi-configs" = {
    enable = true;
    source = ./yazi/configs;
    target = "yazi";
  };
}
