{
  plugins = {
    rustaceanvim.enable = true;
    crates-nvim = {
      enable = true;
      extraOptions = {
        completion.cmp.enabled = true;
      };
    };
    luasnip = {
      enable = true;
      fromVscode = [ {} ];
      fromLua = [ { paths = ./snippets; } ];
    };
    friendly-snippets.enable = true;
    lsp = {
      enable = true;
      servers = {
        lua-ls.enable = true;
      };
    };
    lspkind.enable = true;
    fidget.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp";}
          { name = "luasnip";}
          { name = "crates";}
          { name = "path";}
          { name = "buffer";}
        ];
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-g>" = "cmp.mapping.complete({})";
          "<C-y>" = ''cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              })'';
          "<C-l>" = ''
             cmp.mapping(function(fallback)
               local luasnip = require('luasnip')
               if luasnip.expand_or_locally_jumpable() then
                 luasnip.expand_or_jump()
               else
                 fallback()
               end
             end, { 'i', 's' })
          '';
          "<C-h>" = ''
             cmp.mapping(function(fallback)
               local luasnip = require('luasnip')
               if luasnip.expand_or_locally_jumpable(-1) then
                 luasnip.expand_or_jump(-1)
               else
                 fallback()
               end
             end, { 'i', 's'})
          '';
        };
      };
    };
  };
  keymaps = [
    {
      action = "<Plug>luasnip-next-choice";
      key = "<C-n>";
      mode = [ "i" "s" ];
      # options = ;
    }
    {
      action = "<Plug>luasnip-prev-choice";
      key = "<C-p>";
      mode = [ "i" "s" ];
      # options = ;
    }

  ];
      # vim.api.nvim_set_keymap('i', '<C-n>', '<Plug>luasnip-next-choice', {})
      # vim.api.nvim_set_keymap('s', '<C-n>', '<Plug>luasnip-next-choice', {})
      # vim.api.nvim_set_keymap('i', '<C-p>', '<Plug>luasnip-prev-choice', {})
      # vim.api.nvim_set_keymap('s', '<C-p>', '<Plug>luasnip-prev-choice', {})
}
