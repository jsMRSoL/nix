local bufnr = vim.api.nvim_get_current_buf()

require('gopher').setup()

-- require('gotestit').setup({
--   commands = {
--     gotestsum = gotestsum,
--   }
-- })

local wk = require('which-key')
wk.add({
  -- ['<leader>lt'] = { name = '+tags' },
  -- ['<leader>lT'] = { name = '+tests' },
  -- ['<leader>lm'] = { name = '+mod' },
  { "<leader>lT", group = "tests" },
  { "<leader>lm", group = "mod" },
  { "<leader>lt", group = "tags" },
})

local keymap = {
  { '<space>lg',  ':GoGet ' },
  { '<space>lI',  ':GoImpl ' },
  { '<space>ltj', '<cmd>GoTagAdd json<CR>' },
  { '<space>lty', '<cmd>GoTagAdd yaml<CR>' },
  { '<space>lTa', '<cmd>GoTestsAll<CR>' },
  { '<space>lTA', '<cmd>GoTestAdd<CR>' },
  { '<space>lTe', '<cmd>GoTestsExp<CR>' },
  { '<space>lD',  '<cmd>GoCmt' },
  { '<space>li',  '<cmd>GoIfErr<CR>' },
  { '<space>lmi', ':GoMod init ' },
  { '<space>lmt', '<cmd>GoMod tidy<CR>' },
  -- { '<leader>lTT', '<cmd>GoRunThisTest<CR>' },
  -- { '<leader>lTG', '<cmd>GoRunAllTests<CR>' },
  { ';tt',        '<cmd>GoRunThisTest<CR>' },
  { ';td',        '<cmd>GoRunAllTests<CR>' },
}

for _, v in pairs(keymap) do
  vim.keymap.set('n', v[1], v[2], { noremap = true, buffer = bufnr })
end
