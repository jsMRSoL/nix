{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # rust
    rustup
    gcc
    # go
    go
    # python
    # python312Full
    # virtualenv
  ];

  programs.go = {
    enable = true;
    goPath = ".go";
    goBin = ".go/bin";
  };
}
