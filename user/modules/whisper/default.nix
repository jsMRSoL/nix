{ pkgs, ... }:

let
  # Whisper model derivation
  whisperModel = pkgs.stdenv.mkDerivation {
    pname = "whisper-base-en-model";
    version = "ggml-base.en";
    src = pkgs.fetchurl {
      url = "https://huggingface.co/ggerganov/whisper.cpp/blob/main/ggml-base.bin";
      sha256 = "sha256-qqL2k60iw7r9OBbtzBttl4ytPCFLRJx0yuu1b5PkOb8=";
    };
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out
      cp $src $out/
    '';
  };
in
{
  home.packages = [
    pkgs.whisper-cpp-vulkan   # Vulkan-enabled whisper.cpp
    whisperModel               # the model
    pkgs.mesa                  # AMD Vulkan drivers
    pkgs.vulkan-tools          # optional: test Vulkan
    pkgs.vulkan-loader         # Vulkan ICD loader
    pkgs.sox
  ];

  home.sessionVariables = {
    WHISPER_MODEL_PATH = "${whisperModel}/ggml-base.en.bin";
    # Vulkan environment variables for AMD GPU
    VK_ICD_FILENAMES = "/run/current-system/sw/share/vulkan/icd.d/radeon_icd.x86_64.json";
    VK_LAYER_PATH = "/run/current-system/sw/share/vulkan/explicit_layer.d";
  };
}

# { pkgs, ... }:

# let
#   # Whisper model derivation
#   whisperModel = pkgs.stdenv.mkDerivation {
#     pname = "whisper-base-en-model";
#     version = "ggml-base.en";
#     src = pkgs.fetchurl {
#       url = "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/models/ggml-base.en.bin";
#       sha256 = "sha256-PLACEHOLDER";  # Replace with the real hash
#     };
#     installPhase = ''
#       mkdir -p $out
#       cp $src $out/
#     '';
#   };
# in
# {
#   home.packages = [
#     pkgs.openai-whisper-cpp   # install the executable
#     whisperModel               # install the model
#   ];

#   home.sessionVariables = {
#     WHISPER_MODEL_PATH = "${whisperModel}/ggml-base.en.bin";
#   };
# }
