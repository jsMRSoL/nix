{ system ? builtins.currentSystem }:
let
  nixpkgs = <nixpkgs>;
  pkgs = import nixpkgs {
    config = {
    };
    overlays = [
      (final: prev: {
        sddm-chili-theme = prev.sddm-chili-theme.override {
          themeConfig = {
            background = /home/simon/.config/sddm/Backgrounds/salty_mountains.png;
          };
        };
      })
    ];
  };
  inherit system;
in
pkgs.sddm-chili-theme
