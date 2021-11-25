local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- We use the default settings for ccls and pylsp: the option table can stay empty
lsp.ccls.setup {}
lsp.pylsp.setup {}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list


map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', 'gf', '<cmd>lua vim.lsp.buf.references()<CR>')
--------fzf
map('n', '<c-f>', "<cmd>lua require('fzf-lua').files()<cr>")
map('n', '<c-m-b>', "<cmd>lua require('fzf-lua').buffers()<cr>")
map('n', '<c-t>', "<cmd>lua require('fzf-lua').grep_project()<cr>")
map('n', '<c-m-t>', "<cmd>lua require('fzf-lua').git_status()<cr>")
map('n', '<c-h>', "<cmd>lua require('fzf-lua').command_history()<cr>")
