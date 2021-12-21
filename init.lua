--init autocmd

-- -- set script encoding
-- scriptencoding utf-8
-- -- stop loading config if it's on tiny or small
-- if !1 | finish | endif

-- --General
-- --
-- filetype plugin on
-- set omnifunc=syntaxcomplete#Complete
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options


-- syntax enable                           -- Enables syntax highlighing
opt.hidden = true                              -- Required to keep multiple buffers open multiple buffers
opt.wrap = true                                -- No Display long lines as just one line
opt. pumheight=10                        -- Makes popup menu smaller
opt.ruler = true             			            -- Show the cursor position all the time
opt.cmdheight=2                         -- More space for displaying messages
opt.mouse='a'                             -- Enable your mouse
opt.splitbelow = true                          -- Horizontal splits will automatically be below
opt.re=0
opt.splitright = true                          -- Vertical splits will automatically be to the right
opt.tabstop=2                           -- Insert 2 spaces for a tab
opt.shiftwidth=2                        -- Change the number of space characters inserted for indentation
opt.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab=true                           -- Converts tabs to spaces
opt.smartindent=true                         -- Makes indenting smart
opt.autoindent=true                          -- Good auto indent
opt.laststatus=0                        -- Always display the status line
opt.number = true             -- show line number
opt.relativenumber =true

-- opt.foldmethod='syntax'                  --fold method
-- syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
-- opt.foldlevel=0

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.cursorline = true                          -- Enable highlighting of the current line
opt.showcmd = true
opt.showtabline=2                       -- Always show tabs
opt.showmatch=true
opt.termguicolors=true
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.clipboard='unnamedplus'               -- Copy paste between vim and everything else

require'plugins'
require'general'

-- ---- Searching
opt.hlsearch =true                    -- highlight matches
opt.incsearch=true                   -- incremental searching
opt.ignorecase=true                  -- searches are case insensitive...
opt.smartcase = true                   -- ... unless they contain at least one capital letter
opt.autochdir = true                           -- Your working directory will always be the same as your working directory

g.mapleader=','

-- --Theme
opt.background='dark'                     -- tell vim what the background color looks like

cmd 'colorscheme pinkmare'
-- cmd 'colorscheme onebuddy'
-- cmd 'colorscheme desert'


-- -- Set cursor line color on visual mode
-- cmd [[highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40]]
-- cmd [[highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000]]


