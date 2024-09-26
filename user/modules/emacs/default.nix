{ config, pkgs, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [ pkgs.emacs ];

  # use an absolute path. Otherwise link will point to subtree in nix store.
  home.file = {
    ".emacs.d/early-init.el".source = link /home/simon/.nixos/user/modules/emacs/early-init.el;
    ".emacs.d/simacs.org".source = link /home/simon/.nixos/user/modules/emacs/simacs.org;
  };
}
