local util = require "lspconfig/util"

require'lspsagaconfig'
-- // ---- language server ----
require'lspconfig'.eslint.setup{}
require'lspconfig'.tsserver.setup{}
require('./languages/solidity')
require'lspconfig'.pyright.setup{}
-- averiguar como funciona
-- require'lspconfig'.stylelint_lsp.setup{}
-- // ---- language server ----
require('nvim_comment').setup({line_mapping = "<c-_>", operator_mapping = "<leader>c"})
require('nvimTreeConfig')
require('ultiSnipt')
require('vimwiki')
require'colorizer'.setup()
-- auto complete html tags
require('nvim-ts-autotag').setup()
require('floatTerm')

local filetypes = {
  'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'typescript'
}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}


local map = require('functions').map
local g = vim.g

-- " Open the current file in the default program
map('n','<C-x>', '<cmd>:!xdg-open %<cr>')
map('', '<C-z>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('', '<C-m-z>', '<cmd>:redo<cr>')  -- Make <C-u> undo-friendly
map('','<C-M-r>','<cmd>:source ~/.config/nvim/init.lua<cr>')


-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<C-s>', '<cmd>:w<CR>')    -- save
map('n', '<C-q>', '<cmd>:q<CR>')    -- quit

-- map('n','<c-m>', "<cmd>lua require('OpenTerminal').OpenTerminal() <cr>")

local ts = require 'nvim-treesitter.configs'
ts.setup{
   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

 

-- Use alt + hjkl to resize windows
map ('n','<M-Down>', '<cmd>:resize -2<CR>')
map ('n','<M-Up>', '<cmd>:resize +2<CR>')
map('n','<M-Left>',  '<cmd>:vertical resize -2<CR>')
map('n','<M-Right>', '<cmd>:vertical resize +2<CR>')

map('n',' <M-v>','<cmd>:vsplit<CR>')
map('n',' <M-h>', '<cmd>:split<CR>')

map ('n','<C-Left>','<C-w>h')
map ('n','<C-Down>','<C-w>j')
map ('n','<C-Up>','<C-w>k')
map ('n','<C-Right>','<C-w>l')

-- move between buffers
map ('n','<c-m-Right>','<cmd>:bnext<CR>')
map ('n','<c-m-Left>','<cmd>:bprev<CR>')


map ('','<c-p>', '<cmd>Neoformat<cr>')

