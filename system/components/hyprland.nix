{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    qt6ct
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };
}
