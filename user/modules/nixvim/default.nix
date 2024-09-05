{ pkgs, nixvim, ... }:

let
  nixvimLib = nixvim.lib.${system};
  nixvim' = nixvim.legacyPackages.${system};
  nixvimModule = {
    inherit pkgs;
    module = import ./config;
  }
  nvim = nixvim'.makeNixvimWithModule nixvimModule;
in
{
  home.packages = [ nvim ];
}
