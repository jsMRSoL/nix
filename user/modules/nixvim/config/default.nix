{
  imports = [
    ./autocmds.nix
    ./dap.nix
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

  extraConfigLua = builtins.readFile ./luaconfigs/globals.lua;

  extraFiles = {
		"ftplugin/nix.lua".text = ''
			vim.opt.tabstop = 2
			vim.opt.shiftwidth = 2
			vim.opt.expandtab = true
		'';

		"ftplugin/rust.lua" = {
			source = ./ftplugin/rust.lua;
		};
    
		"ftplugin/go.lua" = {
			source = ./ftplugin/go.lua;
		};
    
		"ftplugin/python.lua" = {
			source = ./ftplugin/python.lua;
		};

		"ftplugin/lua.lua" = {
			source = ./ftplugin/lua.lua;
		};

		"ftplugin/text.lua" = {
			source = ./ftplugin/text.lua;
		};
  };
}
