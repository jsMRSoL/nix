{
  colorschemes.catppuccin.enable = true;

  plugins = {
    dashboard = {
      enable = true;
      settings = {
        change_to_vcs_root = true;
        # shortcut_type = "number";
        config = {
          header = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          mru = {
            limit = 10;
          };
          project = {
            enable = true;
          };
          shortcut = [
            {
              action = {
                __raw = "function(path) vim.cmd('Telescope find_files') end";
              };
              desc = "Files";
              group = "Label";
              icon = " ";
              icon_hl = "@variable";
              key = "f";
            }
            {
              action = "Telescope app";
              desc = " Apps";
              group = "DiagnosticHint";
              key = "a";
            }
            {
              action = "Telescope dotfiles";
              desc = " dotfiles";
              group = "Number";
              key = "d";
            }
          ];
        };
        theme = "hyper";
      };
    };
    # fancy input and selection boxes
    dressing.enable = true;
    # fancy notification boxes
    notify.enable = true;
    # nice statusline
    lualine.enable = true;
    # nice tabs
    bufferline.enable = true;
  };
}
