{ pkgs ? import <nixpkgs> {} } : pkgs.mkShell {
  packages = with pkgs; [
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
  ];
}
