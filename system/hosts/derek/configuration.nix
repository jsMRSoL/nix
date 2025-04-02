{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../components/bluetooth.nix
    ../../components/bootloader_systemd_efi.nix
    ../../components/core.nix
    ../../components/backlight.nix
    ../../components/garbage_collection.nix
    ../../components/sddm.nix
    ../../components/sound.nix
    # ../../components/dell-bios-fan-control.nix
    # ../../components/sway.nix
    ../../components/hyprland.nix
    ../../components/wayland.nix
    # ../../components/postgres.nix
    ../../components/virtualization.nix
  ];

  hardware.graphics.enable = true;

  networking.hostName = "derek"; # Define your hostname.

  users.users.simon.extraGroups = [
    "libvirtd"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [ ];

  system.stateVersion = "24.05"; # Don't touch! I mean it!
}
