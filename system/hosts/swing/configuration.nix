{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../components/bootloader.nix
      ../../components/core.nix
      ../../components/backlight.nix
      ../../components/garbage_collection.nix
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

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
