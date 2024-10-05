{ pkgs, inputs, ... }:
{
  # Configure console keymap
  console.keyMap = "uk";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      80
      443
      631
    ];
    allowedUDPPorts = [ ];
  };

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

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
    dig
    git
    inputs.mypassmenu.defaultPackage
    killall
    neovim
    nmap
    nurl # cli tool to generate nix fetcher calls
    pass
    pciutils
    pinentry-gtk2
    procps
    wget
    wirelesstools
  ];

  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # gnupg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = [ ];
  };
}
