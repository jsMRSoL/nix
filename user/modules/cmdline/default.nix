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
      nixvim.packages.x86_64-linux.default
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
