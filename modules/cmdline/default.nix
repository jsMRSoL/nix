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
      neovim
      papirus-icon-theme
      ripgrep
      sway-contrib.grimshot
      sxiv
      unar
      xdg-utils
      yazi
      zoxide
  ];
}
