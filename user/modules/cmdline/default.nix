{ pkgs, ...}:
{
  home.packages = with pkgs; [
      bash-preexec
      exiftool
      htop
      imagemagick
      lazygit
      libnotify
      mediainfo
      mpv
      mupdf
      papirus-icon-theme
      ripgrep
      sway-contrib.grimshot
      sxiv
      vim
      unar
      xdg-utils
      zoxide
  ];
}
