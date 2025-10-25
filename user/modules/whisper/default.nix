{ pkgs, ... }:
{
  home.packages = [
    pkgs.whisper-cpp-vulkan   # Vulkan-enabled whisper.cpp
    pkgs.mesa                  # AMD Vulkan drivers
    pkgs.vulkan-tools          # optional: test Vulkan
    pkgs.vulkan-loader         # Vulkan ICD loader
  ];

  home.sessionVariables = {
    # Vulkan environment variables for AMD GPU
    VK_ICD_FILENAMES = "/run/current-system/sw/share/vulkan/icd.d/radeon_icd.x86_64.json";
    VK_LAYER_PATH = "/run/current-system/sw/share/vulkan/explicit_layer.d";
  };
}
