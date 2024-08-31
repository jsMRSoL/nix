{ pkgs, ...}:
{
  programs.yazi.enable = true;

  xdg.configFile."yazi-configs" = {
    enable = true;
    source = ./yazi;
    target = "yazi";
  };

  # plugin dependencies
  home.packages = with pkgs; [
    catdoc
    python312Packages.doc2txt
    python312Packages.xlsx2csv
    odt2txt
  ];
}

