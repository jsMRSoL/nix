{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    # cargo
    # rust-analyzer
    # rustfmt
    # clippy
  ];
}
