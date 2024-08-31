{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };

  environment.packages = with pkgs; [
    mako # notification system developed by swaywm maintainer
  ];
}
