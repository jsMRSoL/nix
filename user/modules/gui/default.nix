{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.gui_programs;
  type = lib.types.bool;
  default = true;
  OptionYes = lib.mkOption { inherit type default; };
  optionThis = app: (lib.optionals cfg.${app}.enable [ pkgs.${app} ]);
in
{
  options = {
    gui_programs.filezilla.enable = OptionYes;
    gui_programs.gimp3.enable = OptionYes;
    gui_programs.gthumb.enable = OptionYes;
    gui_programs.handbrake.enable = OptionYes;
    gui_programs.insomnia.enable = OptionYes;
    gui_programs.libreoffice-fresh.enable = OptionYes;
    gui_programs.makemkv.enable = OptionYes;
    gui_programs.mkvtoolnix.enable = OptionYes;
    gui_programs.pavucontrol.enable = OptionYes;
    gui_programs.pdfarranger.enable = OptionYes;
    gui_programs.simple-scan.enable = OptionYes;
    gui_programs.simplescreenrecorder.enable = OptionYes;
    gui_programs.sqlitebrowser.enable = OptionYes;
    gui_programs.zed-editor.enable = OptionYes;
  };

  config = {
    home.packages =
      optionThis "filezilla"
      ++ optionThis "gimp3"
      ++ optionThis "gthumb"
      ++ optionThis "handbrake"
      ++ optionThis "insomnia"
      ++ optionThis "libreoffice-fresh"
      ++ optionThis "makemkv"
      ++ optionThis "mkvtoolnix"
      ++ optionThis "pavucontrol"
      ++ optionThis "pdfarranger"
      ++ optionThis "simple-scan"
      ++ optionThis "simplescreenrecorder"
      ++ optionThis "sqlitebrowser"
      ++ optionThis "zed-editor";
  };
}
