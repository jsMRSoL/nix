{ pkgs, ...}:
{
  plugins = {
    nix.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        tsserver.enable = true;
      };
    };
    rustaceanvim.enable = true;
    crates-nvim = {
      enable = true;
      extraOptions = {
        completion.cmp.enabled = true;
      };
    };
    lsp-format =  {
      enable = true;
      lspServersToEnable = "all";
    };
    lspkind.enable = true;
    fidget.enable = true;
    luasnip = {
      enable = true;
      fromVscode = [ {} ];
      fromLua = [ { paths = ./snippets; } ];
    };
    friendly-snippets.enable = true;
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


  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "gopher.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "olexsmir";
        repo = "gopher.nvim";
        rev = "f55c15ada8e02398000c04a96ef44d986cd01051";
        hash = "sha256-ExB8jSmjMBuNJ8XQ8pVEaOo6moIMyNogBMHlDc0frHA=";
      };      
  })];

  keymaps = [
    {
      action = "<Plug>luasnip-next-choice";
      key = "<C-n>";
      mode = [ "i" "s" ];
    }
    {
      action = "<Plug>luasnip-prev-choice";
      key = "<C-p>";
      mode = [ "i" "s" ];
    }
  ];
}
