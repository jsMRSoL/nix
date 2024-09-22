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
    rsync
    simple-scan
    simplescreenrecorder
    sqlitebrowser
    zed-editor
  ];
}
