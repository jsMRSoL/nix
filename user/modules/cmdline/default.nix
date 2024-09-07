{ pkgs, nixvim, ...}:
{
  home.packages = with pkgs; [
    bacon
    bash-preexec
    bat
    duf
    exiftool
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
    sway-contrib.grimshot
    sxiv
    tesseract
    tmux
    trash-cli
    unpaper
    vim
    wipe
    unar
    xdg-utils
    zoxide
  ];
}
