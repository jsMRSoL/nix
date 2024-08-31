# Edit this configuration file to define what should be installed on your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

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

  # Will be exposed through DBus to programs willing to store secrets.
  # services.gnome.gnome-keyring.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [];

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

  system.stateVersion = "24.05"; # Must leave at state of first install
}
