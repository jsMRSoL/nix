{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../components/bootloader.nix
      ../../components/core.nix
      ../../components/sddm.nix
      ../../components/sound.nix
      ../../components/sway.nix
      ../../components/wayland.nix
    ];

  hardware.graphics.enable = true;

  networking.hostName = "swing"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [];

  # overlays
  nixpkgs.overlays = [
    (final: prev: {
       sddm-chili-theme = prev.sddm-chili-theme.override {
         themeConfig = {
           background = "${../../../assets/salty_mountains.png}";
           ScreenWidth = 1366;
           ScreenHeight = 768;
         };
       };
    })
  ];

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
