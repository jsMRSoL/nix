  {
    pkgs
  , lib
  , ...
  }:

  let
  sddm-chili-theme = pkgs.sddm-chili-theme.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches ++ [
      (pkgs.fetchpatch {
        name = "set-themes-directory.patch";
        url = "file://chili.patch";
        sha256 = lib.fakeSha256; # Put the checksum that nix complains to you about here
      })
    ];
  });
  chili = pkgs.sddm-chili-theme.override {inherit sddm-chili-theme;};
  in
  environment.systemPackages = [ chili ];
