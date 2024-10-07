{
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "dell-bios-fan-control";
  name = "dell-bios-fan-control";
  version = "unstable-2018-05-21";

  src = fetchFromGitHub {
    owner = "TomFreudenberg";
    repo = "dell-bios-fan-control";
    rev = "27006106595bccd6c309da4d1499f93d38903f9a";
    hash = "sha256-3ihzvwL86c9VJDfGpbWpkOwZ7qU0E5U2UuOeCwPMR1s=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp dell-bios-fan-control $out/bin/dell-bios-fan-control
    chmod +rx $out/bin/dell-bios-fan-control
  '';
}
