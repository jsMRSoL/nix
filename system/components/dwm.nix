{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = pkgs.fetchFromGitHub {
          owner = "jsMRSoL";
          repo = "dwm";
          rev = "95014cb2f8bd9feb31f0f1f3058146aff602386f";
          hash = "sha256-PkwV3Qe04ASM9R28ESZXGIekTNRW1nQ3WmAZgLojo90=";
        };
      };
    };
  };

  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    (callPackage ../../user/modules/dmenu/dmenu.nix { })
    (callPackage ../../user/modules/st/default.nix { })
    sxhkd
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
      options = "ctrl:nocaps";
    };
    displayManager.lightdm = {
      background = ../../assets/nix-wallpaper-nineish-dark-gray.png;
      greeters.gtk = {
        enable = true;
        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
        extraConfig = ''
          position = 10% 40%
        '';
      };
    };
  };
}
