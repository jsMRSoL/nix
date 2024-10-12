{ pkgs, ... }:
let
  sddm-chili-theme' = pkgs.sddm-chili-theme.override {
    themeConfig = {
      background = "${../../assets/nix-wallpaper-nineish-dark-gray.png}";
      ScreenWidth = 1920;
      ScreenHeight = 1080;
    };
  };
in
{
  environment.systemPackages = [
    sddm-chili-theme'
  ];

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "chili"; # elarun, maldives, maya
      wayland.enable = true;
    };
  };

  security.polkit.enable = true;
}
