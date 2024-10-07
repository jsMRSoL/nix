{
  stdenv,
  fetchFromGitHub,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "i8kutils";
  version = "v1";

  src = fetchFromGitHub {
    owner = "vitorafsr";
    repo = "i8kutils";
    rev = "c993fb1da1bba5c2cd2860c1aa6c3916b4de77e4";
    hash = "sha256-yANw44IvANb5w+HnmoTYevg6ohic0pXBwz8eBlnZjjY=";
  };

  buildInputs = [ pkgs.tcl ];

  installPhase = ''
    mkdir -p $out/bin
    cp i8kmon $out/bin/i8kmon
    cp i8kctl $out/bin/i8kctl
    cp i8kfan $out/bin/i8kfan
    chmod +rx $out/bin/i8kmon
    chmod +rx $out/bin/i8kctl
    chmod +rx $out/bin/i8kfan
    mkdir -p $out/etc
    cp i8kmon.conf $out/etc/i8kmon.conf
    substituteInPlace $out/bin/i8kmon \
      --replace "/etc/i8kmon.conf" "$out/etc/i8kmon.conf"
    substituteInPlace $out/bin/i8kmon \
      --replace "/usr/bin/i8kfan" "$out/bin/i8kfan"
    substituteInPlace $out/bin/i8kfan \
      --replace "/usr/bin/i8kctl" "$out/bin/i8kctl"
  '';
})
