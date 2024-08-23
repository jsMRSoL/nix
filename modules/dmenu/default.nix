{ pkgs ? import <nixpkgs> {} }:

pkgs.stdEnv.mkDerivation {
  name = "dmenu";
  src = pkgs.fetchFromGitHub {
    owner = "jsMRSoL";
    repo = "dmenu";
    rev = "e5cfa7b1b3267f8a34672980d11a2d196eff4b83";
    hash = "sha256-p+JSjGMv85YXoOTmP35zRMWhZsbVnE1UpiOhvf/+/Y8=";
  };
}
