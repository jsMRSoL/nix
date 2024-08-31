{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
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
