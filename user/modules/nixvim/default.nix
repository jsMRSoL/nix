{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./diagnostics.nix
    ./editor.nix
    ./floaterm.nix
    ./git.nix
    ./keybindings.nix
    ./lsp.nix
    ./options.nix
    ./performance.nix
    ./telescope.nix
    ./treesitter.nix
    ./ui.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
