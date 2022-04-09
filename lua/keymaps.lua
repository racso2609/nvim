local map = require('functions').map

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

-- Use alt + hjkl to resize windows
map ('n','<C-M-Down>', '<cmd>:resize -2<CR>')
map ('n','<C-M-Up>', '<cmd>:resize +2<CR>')
map('n','<C-M-Left>',  '<cmd>:vertical resize -2<CR>')
map('n','<C-M-Right>', '<cmd>:vertical resize +2<CR>')

map ('n','<C-Left>','<C-w>h')
map ('n','<C-Down>','<C-w>j')
map ('n','<C-Up>','<C-w>k')
map ('n','<C-Right>','<C-w>l')



-- Tree --
require("Tree")
local g = vim.g
local map = require('functions').map

g['nvim_tree_quit_on_open'] = 1
g['nvim_tree_indent_markers'] = 1
g['nvim_tree_highlight_opened_files'] = 1
g['nvim_tree_disable_window_picker'] = 1


map ('n','<C-b>' ,'<cmd>NvimTreeToggle<CR>')

-- Float Term --

local g = vim.g;
g.floaterm_keymap_toggle = '<c-a>'

g.floaterm_gitcommit='floaterm'
g.floaterm_autoinsert=1
g.floaterm_width=0.8
g.floaterm_height=0.8
g.floaterm_wintitle=0
g.floaterm_autoclose=1


