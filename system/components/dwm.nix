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
    st
    (callPackage ../../user/modules/dmenu/dmenu.nix {})
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
    options = "ctrl:nocaps";
  };

}
