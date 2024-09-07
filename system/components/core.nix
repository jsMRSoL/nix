{ pkgs, inputs, ... }:
{
  # Configure console keymap
  console.keyMap = "uk";

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable the upower daemon
  services.upower.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Set fonts
  fonts.packages = with pkgs; [
    fira-code-nerdfont
    source-code-pro
    hack-font
  ];

  environment.systemPackages = with pkgs; [
   wget
   pciutils
   alsa-utils
   nurl # cli tool to generate nix fetcher calls
   dig
   wirelesstools
   pass
   inputs.mypassmenu.packages.x86_64-linux.defaultPackage
   pinentry-gtk2
   neovim
   git
  ];

  # Environment variables
  environment.variables.EDITOR = "nvim";

  # gnupg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
