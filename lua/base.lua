local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options


vim.o.completeopt = "menuone,noselect"
cmd 'set termguicolors'

-- syntax enable                           -- Enables syntax highlighing
opt.hidden = true -- Required to keep multiple buffers open multiple buffers
opt.wrap = true -- No Display long lines as just one line
opt.pumheight = 10 -- Makes popup menu smaller
opt.ruler = true -- Show the cursor position all the time
opt.cmdheight = 2 -- More space for displaying messages
opt.mouse = 'a' -- Enable your mouse
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.re = 0
opt.splitright = true -- Vertical splits will automatically be to the right
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.shiftwidth = 2 -- Change the number of space characters inserted for indentation
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab = true -- Converts tabs to spaces
opt.smartindent = true -- Makes indenting smart
opt.autoindent = true -- Good auto indent
opt.laststatus = 0 -- Always display the status line

-- show line number
opt.number = true
opt.relativenumber = true

opt.pumheight = 10 -- Makes popup menu smaller
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.showcmd = true

-- Always show tabs
opt.showtabline = 2
opt.showmatch = true

-- Command-line completion mode
opt.wildmode = { 'list', 'longest' }

-- Copy paste between vim and everything else
opt.clipboard = 'unnamedplus'

-- require'general'

-- ---- Searching
-- highlight matches
opt.hlsearch = true

-- incremental searching
opt.incsearch = true

-- ... unless they contain at least one capital letter
opt.ignorecase = true -- searches are case insensitive...

-- Your directory will always be the same as your working directory
opt.autochdir = true

g.mapleader = ','

-- cmd 'colorscheme pinkmare'
-- cmd 'colorscheme onebuddy'
-- cmd 'colorscheme onebuddy'
cmd 'colorscheme gruvbox'
-- cmd 'colorscheme everblush'
-- require('colorbuddy').colorscheme('onebuddy')
-- cmd 'hi Normal guibg=NONE ctermbg=NONE';

-- -- Set cursor line color on visual mode
-- cmd [[highlight Visual cterm=NONE ctermbg=235 ctermfg=NONE guibg=Grey40]]
-- cmd [[highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000]]
vim.g.python3_host_prog = '/home/racso/.pyenv/versions/nvim/bin/python'

cmd 'au BufReadPost *.cairo set filetype=cairo'
cmd 'au Filetype cairo set syntax=cairo'
