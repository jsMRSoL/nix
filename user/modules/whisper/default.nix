{ pkgs, ... }:

let
  # Whisper model derivation
  whisperModel = pkgs.stdenv.mkDerivation {
    pname = "whisper-base-en-model";
    version = "ggml-base.en";
    src = pkgs.fetchurl {
      url = "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/models/ggml-base.en.bin";
      sha256 = "sha256-PLACEHOLDER";  # Replace with the real hash
    };
    installPhase = ''
      mkdir -p $out
      cp $src $out/
    '';
  };
in
{
  home.packages = [
    pkgs.openai-whisper-cpp   # install the executable
    whisperModel               # install the model
  ];

  home.sessionVariables = {
    WHISPER_MODEL_PATH = "${whisperModel}/ggml-base.en.bin";
  };
}
