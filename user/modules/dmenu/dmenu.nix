{ 
  stdenv,
  fetchFromGitHub,
  libX11,
  libXinerama,
  libXft,
}:

stdenv.mkDerivation {
  name = "dmenu";
  src = fetchFromGitHub {
    owner = "jsMRSoL";
    repo = "dmenu";
    rev = "e5cfa7b1b3267f8a34672980d11a2d196eff4b83";
    hash = "sha256-p+JSjGMv85YXoOTmP35zRMWhZsbVnE1UpiOhvf/+/Y8=";
  };

  buildInputs = [ libX11 libXinerama libXft ];

  installPhase = ''
    mkdir -p $out/bin
    cp dmenu $out/bin
    cp dmenu_path $out/bin
    cp dmenu_run $out/bin
    cp stest $out/bin
  '';
}
