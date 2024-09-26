{ pkgs, ... }:
{
  home.packages = with pkgs; [
    filezilla
    gimp
    gthumb
    handbrake
    insomnia
    libreoffice-fresh
    mkvtoolnix
    pavucontrol
    pdfarranger
    simple-scan
    simplescreenrecorder
    sqlitebrowser
    zed-editor
  ];
}
