{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs
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
