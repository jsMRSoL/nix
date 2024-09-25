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
    rsync
    simple-scan
    simplescreenrecorder
    sqlitebrowser
    zed-editor
  ];
}
