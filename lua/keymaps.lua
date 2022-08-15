-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local wk = require("which-key")
local g = vim.g

-- Functional wrapper for mapping custom keybindings
function Keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

wk.register({
  d = {
    name = "Diagnostic",
    e = { name = "open float" },
    ["["] = { name = "prev error" },
    ["]"] = { name = "next error" },
    q = { name = "set loc list" },
  },
  t = {
    name = "Terminal / Telescope ",
    o = { "open" },
    c = { "Clipboard" },
    m = { "Media files" },
    f = { "Find file" },
    t = { 'Grep text' },
  },
  s = {
    name = "Snippets",
    l = { "list snippets" },
    a = { "add snippets file" },
    e = { "edit snippets file" },
  },
  g = {
    name = "git",
    d = "open commit dashboard"
  },
  n = {
    name = 'Notes',
    l = { "get all todo comments" },
    t = { "Telekasten" }
  },
  c = {
    name = 'Code action',
    a = { "Execute code action" }
  },
  f = { 'Format' },
  r = {'Rename action'}

}, { prefix = '<space>' })

wk.register({
  gd = { 'go to definition' },
  gi = { 'go to implementation' },
  gD = { 'go to declaration' },
  K = { 'open modal hover' },
})

Keymap('n', '<space>de', vim.diagnostic.open_float, opts)
Keymap('n', '<space>d[', vim.diagnostic.goto_prev, opts)
Keymap('n', '<space>d]', vim.diagnostic.goto_next, opts)
Keymap('n', '<space>dq', vim.diagnostic.setloclist, opts)

-- file explorer
Keymap('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')


-- Float Term --

g.floaterm_keymap_toggle = '<space>to'
g.floaterm_gitcommit = 'floaterm'
g.floaterm_autoinsert = 1
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_wintitle = 0
g.floaterm_autoclose = 1

-- UltiSnips
g.UltiSnipsExpandTrigger = "<C-u>"
g.UltiSnipsJumpForwardTrigger = '<tab>'
g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
g.UltiSnipsListSnippets = "<space>sl";


Keymap('n', '<space>sa', ":UltiSnipsAddFileTypes", opts)
Keymap('n', '<space>se', ":UltiSnipsEdit<cr>", opts)


-- "emmet-vim
g.user_emmet_mode = 'a'
g.user_emmet_leader_key = '<C-a>'

-- comment
Keymap('n', '<C-c>', '<cmd>:CommentToggle<CR>');

-- telescope --
--

Keymap('n', '<space>tf', '<cmd>:Telescope find_files<CR>');
Keymap('n', '<space>tt', '<cmd>:Telescope live_grep<CR>');
Keymap('n', '<space>tb', '<cmd>:Telescope buffers<CR>');
Keymap('n', '<space>th', '<cmd>:Telescope help_tags<CR>');
Keymap('n', '<space>tc', '<cmd>:Telescope neoclip<CR>');
Keymap('n', '<space>tm', '<cmd>:Telescope media_files<CR>');

-- git
Keymap('n', '<space>gd', ':Neogit<cr>')


-- Todos --
Keymap('n', '<space>nl', '<cmd>:TodoQuickFix<CR>');
Keymap('n', '<space>nt', '<cmd>:Telekasten<CR>');


-- Clear highlights
Keymap('n', '<C-l>', '<cmd>noh<CR>')

-- save
Keymap('n', '<C-s>', '<cmd>:w<CR>')

-- quit
Keymap('n', '<C-q>', '<cmd>:q<CR>')


-- Split window
Keymap('n', 'ss', ':split<Return><C-w>w')
Keymap('n', 'sv', ':vsplit<Return><C-w>w')

-- Use alt + hjkl to resize windows
Keymap('n', '<C-M-Down>', '<cmd>:resize -2<CR>')
Keymap('n', '<C-M-Up>', '<cmd>:resize +2<CR>')
Keymap('n', '<C-M-Left>', '<cmd>:vertical resize -2<CR>')
Keymap('n', '<C-M-Right>', '<cmd>:vertical resize +2<CR>')

-- Use alt + hjkl to move into windows
Keymap('n', '<C-Left>', '<C-w>h')
Keymap('n', '<C-Down>', '<C-w>j')
Keymap('n', '<C-Up>', '<C-w>k')
Keymap('n', '<C-Right>', '<C-w>l')

-- Delete a word backwards
Keymap('n', 'dw', 'vb"_d')

-- Select all
Keymap('n', '<C-a>', 'gg<S-v>G')

-- Make <C-u> undo-friendly
Keymap('', '<C-z>', '<C-g>u<C-u>')

-- Make <C-u> undo-friendly
Keymap('', '<C-m-z>', '<cmd>:redo<cr>')

-- restart vim config
Keymap('n', 'rc', '<cmd>:source ~/.config/nvim/init.lua<cr>')
