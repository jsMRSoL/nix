{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    gcc
    # cargo
    # rust-analyzer
    # rustfmt
    # clippy
  ];
}
