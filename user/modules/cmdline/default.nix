{ pkgs, nixvim, ...}:
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
      # neovim
      nixvim
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
