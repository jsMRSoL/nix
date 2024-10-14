{ pkgs, ... }:
let
  st' = pkgs.st.override {
    patches = [
      ../../user/modules/st/patches/st-clipboard-0.8.3.diff
      # ../../user/modules/st/patches/st-scrollback-0.9.2.diff
    ];
    conf = builtins.readFile ../../user/modules/st/config.h;
  };
in
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
    st'
    sxhkd
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
    options = "ctrl:nocaps";
  };

}
