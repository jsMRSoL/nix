{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../components/bootloader.nix
      ../../components/core.nix
      ../../components/backlight.nix
      ../../components/garbage_collection.nix
      ../../components/dwm.nix
      ../../components/sound.nix
    ];

  hardware.graphics.enable = true;

  networking.hostName = "rapier"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   # (callPackage ../modules/dmenu/dmenu.nix {})
  ];

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
