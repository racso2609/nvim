local util = require "lspconfig/util"
require "lsp_signature".setup{}

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
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
-- vim.cmd 'source ~/.config/nvim/lua/prettier.vim'

local filetypes = {
  'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'typescript'
}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}


local map = require('functions').map
-- local g = vim.g

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
  ignore_install = { "solidity" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust","solidity" },  -- list of language that will be disabled
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


map ('','<c-p>', '<cmd>:Prettier<cr>')

