local opts = {
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	tabstop = 2,
	textwidth = 120,
	colorcolumn = '80',
	wrap = false,
}

local set_local_opts = function(opts)
	for k, v in pairs(opts) do
		vim.opt_local[k] = v
	end
end

set_local_opts(opts)
