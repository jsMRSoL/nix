{
  pkgs,
  stdenv,
  fetchFromGitHub,
  libXft,
  ...
}:

stdenv.mkDerivation {
  pname = "st-patched";
  version = "8.2";

  src = fetchFromGitHub {
    owner = "jsMRSoL";
    repo = "st-patched";
    rev = "be595bf1ecc614a2de6c67b6b32355d30af86dd4";
    hash = "sha256-XvipcHmsmbh729L98BRvH3zgnC7tzxedU9jm8tMTNJM=";
  };

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  buildInputs = [
    libXft
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp st $out/bin
  '';
}
