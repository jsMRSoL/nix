let
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
in {
  dmenu = pkgs.callPackage ./dmenu.nix { };
}
