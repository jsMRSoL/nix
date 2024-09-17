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
            ""
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
              action = {
                __raw = ''
                  function()
                    require("telescope.builtin").find_files({
                      prompt_title = "<= neovim config =>",
                      cwd = "~/.nixos/user/modules/nixvim/config/",
                    })
                  end
                '';
              };
              desc = " dotfiles";
              group = "Number";
              key = "d";
            }
            {
              action = "q!";
              desc = "Quit";
              group = "Label";
              key = "q";
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
    # colours for colour codes
    nvim-colorizer.enable = true;
    # neo-tree
    neo-tree.enable = true;
  };
}
