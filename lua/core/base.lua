local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt -- to set options

if not vim.notify then
	vim.notify = function(msg, type)
		print(msg .. type)
	end
end

vim.o.completeopt = "menuone,noselect"
cmd("set termguicolors")
cmd("set spell")

-- syntax enable                           -- Enables syntax highlighting
opt.hidden = true -- Required to keep multiple buffers open multiple buffers
opt.wrap = true -- No Display long lines as just one line
opt.pumheight = 10 -- Makes pop-up menu smaller
opt.ruler = true -- Show the cursor position all the time
opt.cmdheight = 2 -- More space for displaying messages
opt.mouse = "a" -- Enable your mouse
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
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

opt.showcmd = true

-- Always show tabs
opt.showtabline = 2
opt.showmatch = true

-- Command-line completion mode
opt.wildmode = { "list", "longest" }

-- Copy paste between vim and everything else
opt.clipboard = "unnamedplus"

-- ---- Searching
-- highlight matches
opt.hlsearch = true

-- incremental searching
opt.incsearch = true

-- search unless they contain at least one capital letter
opt.ignorecase = true -- searches are case insensitive...
opt.smartcase = true -- searches are case insensitive...

-- Your directory will always be the same as your working directory
opt.autochdir = true
opt.swapfile = false
-- Save undo history
vim.o.undofile = true

vim.g.python3_host_prog = "/home/racso/.pyenv/versions/nvim/bin/python"
