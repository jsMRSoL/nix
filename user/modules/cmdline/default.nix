{ pkgs, ...}:
{
  home.packages = with pkgs; [
    bacon
    bash-preexec
    bat
    clipman
    duf
    exiftool
    fd
    ffmpeg
    ffmpegthumbnailer
    fzf
    htop
    imagemagick
    lazygit
    ledger
    libnotify
    makemkv
    mediainfo
    mpv
    mupdf
    # neovim
    # nixvim.packages.x86_64-linux.default
    ncdu
    papirus-icon-theme
    ripgrep
    rsync
    sway-contrib.grimshot
    sxiv
    tesseract
    trash-cli
    tree
    unpaper
    vim
    wipe
    unar
    xdg-utils
    xorg.xrdb
  ];

  home.file."Xresources" = {
    enable = true;
    source = ./Xresources;
    target = ".Xresources";
  };
}
