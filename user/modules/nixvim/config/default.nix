{
  imports = [
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

  extraFile = {
		"ftplugin/nix.lua".text = ''
			vim.opt.tabstop = 2
			vim.opt.shiftwidth = 2
			vim.opt.expandtab = true
		'';

		"ftplugin/rust.lua" = {
			source = ./ftplugin/rust.lua;
		};
  };
}
