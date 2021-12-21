local map = require'functions'.map
local saga = require'lspsaga'

saga.init_lsp_saga{
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round"
}

map('','<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>');
-- map('','k', '<cmd>lua vim.lsp.buf.hover()<cr>');
map('','<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>');
-- map('','gh', '<cmd>Lspsaga lsp_finder<cr>');

