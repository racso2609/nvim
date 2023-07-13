local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

vim.o.completeopt = "menuone,noselect"
cmd("set termguicolors")

-- syntax enable                           -- Enables syntax highlighting
opt.hidden = false
opt.wrap = true -- No Display long lines as just one line
opt.pumheight = 10 -- Makes popup menu smaller
opt.ruler = true -- Show the cursor position all the time
opt.cmdheight = 2 -- More space for displaying messages
opt.mouse = "a" -- Enable your mouse

opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right

opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.shiftwidth = 2 -- Change the number of space characters inserted for indentation
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.smartindent = true -- Makes indenting smart
opt.autoindent = true -- Good auto indent
opt.laststatus = 0 -- Always display the status line
opt.showtabline = 2
opt.showmatch = true

-- show line number
-- TODO: make  function to change it
opt.number = true
opt.relativenumber = true

vim.o.foldmethod = "expr"

-- Command-line completion mode
opt.wildmode = { "list", "longest" }

-- Copy paste between vim and everything else
opt.clipboard = "unnamedplus"

-- highlight matches
opt.hlsearch = true
-- incremental searching
opt.incsearch = true
-- ... unless they contain at least one capital letter
opt.ignorecase = true -- searches are case insensitive...
opt.smartcase = true -- searches are case insensitive...

-- Your directory will always be the same as your working directory
opt.autochdir = true

-- Save undo history
vim.o.undofile = true
g.python3_host_prog = "/home/racso/.pyenv/versions/nvim/bin/python"
g.mapleader = " "

cmd("au BufReadPost *.cairo set filetype=cairo")
cmd("au Filetype cairo set syntax=cairo")
