# Edit this configuration file to define what should be installed on

# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../components/bootloader_systemd_efi.nix
      ../../components/core.nix
      ../../components/sddm.nix
      ../../components/sound.nix
      ../../components/sway.nix
      ../../components/wayland.nix
    ];

  hardware.graphics.enable = true;

  networking.hostName = "swing"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the gnome-keyring secrets vault. 
  # services.gnome.gnome-keyring.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [];

  # overlays
  nixpkgs.overlays = [ (finalAttrs: previousAttrs: {
        sddm-chili-theme = previousAttrs.sddm-chili-theme.overrideAttrs {
          src = pkgs.fetchFromGitHub {
            owner = "jsMRSoL";
            repo = "jalapeno";
            rev = "34144ad7adf9469e40645fc5158f35d5dabfe262";
            hash = "sha256-QO5pPTHCHsi2NWl3hAa354D4Sk6OZBAyoLzYLgF8AzE=";
          };
        };
      })
  ];

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
