{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mako # notification system developed by swaywm maintainer
  ];
}
