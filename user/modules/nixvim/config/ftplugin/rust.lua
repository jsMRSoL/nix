local bufnr = vim.api.nvim_get_current_buf()
local keymap = {
  { '<space>lh',  '<cmd>RustHoverActions<CR>' },
  { '<space>lH',  '<cmd>RustHoverRange<CR>' },
  { '<space>le',  '<cmd>RustExpandMacro<CR>' },
  { '<space>lE',  '<cmd>RustOpenExternalDocs<CR>' },
  { '<space>lf',  '<cmd>RustFmt<CR>' },
  { '<space>lR',  '<cmd>RustRunnables<CR>' },
  { '<space>lD',  '<cmd>RustDebuggables<CR>' },
  { '<space>lmd', '<cmd>RustMoveItemDown<CR>' },
  { '<space>lmu', '<cmd>RustMoveItemUp<CR>' },
  { '<space>lc',  '<cmd>RustOpenCargo<CR>' },
  { '<space>lp',  '<cmd>RustParentModule<CR>' },
  { '<space>lj',  '<cmd>RustJoinLines<CR>' },
}

for _, v in pairs(keymap) do
  vim.keymap.set('n', v[1], v[2],
    { noremap = true, buffer = bufnr })
end

local wk = require('which-key')
wk.register({
  ['<leader>lm'] = { name = '+move' },
})
