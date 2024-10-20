{ pkgs, ... }:
let
  ocreng = pkgs.writeShellScriptBin "ocreng" ''
    count=1
    for page in *.png; do
      no=$(printf "%02d" $count)
      ${pkgs.tesseract}/bin/tesseract "$page" "''${page/.png/$no}" -l eng
      count=$((count + 1))
    done

    for file in *.txt; do
      cat "$file" >> binder.txt
      rm "$file"
    done
  '';

  ocrlatin = pkgs.writeShellScriptBin "ocrlatin" ''
    count=1
    for page in *.png; do
      no=$(printf "%02d" $count)
      ${pkgs.tesseract}/bin/tesseract "$page" "''${page/.png/$no}" -l lat+eng
      count=$((count + 1))
    done

    for file in *.txt; do
      cat "$file" >> binder.txt
      rm "$file"
    done
  '';

  ocrgreek = pkgs.writeShellScriptBin "ocrgreek" ''
    count=1
    for page in *.png; do
      no=$(printf "%02d" $count)
      ${pkgs.tesseract}/bin/tesseract "$page" "''${page/.png/$no}" -l grc+eng
      count=$((count + 1))
    done

    for file in *.txt; do
      cat "$file" >> binder.txt
      rm "$file"
    done
  '';
in
{
  home.packages = [
    ocreng
    ocrgreek
    ocrlatin
  ];
}
