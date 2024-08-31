{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../components/bootloader.nix
      ../../components/core.nix
      ../../components/sound.nix
    ];

  hardware.graphics.enable = true;

  networking.hostName = "pistol"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [];

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
