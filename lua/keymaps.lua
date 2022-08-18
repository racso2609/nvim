-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local wk = require("which-key")
local g = vim.g
local keymap = require("exports").keymap

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
    t = { "Grep text" },
  },
  s = {
    name = "Snippets",
    l = { "list snippets" },
    a = { "add snippets file" },
    e = { "edit snippets file" },
  },
  g = {
    name = "git",
    d = "open commit dashboard",
  },
  n = {
    name = "Notes",
    l = { "get all todo comments" },
    t = { "Telekasten" },
  },
  c = {
    name = "Code action",
    a = { "Execute code action" },
  },
  f = { "Format" },
  r = { "Rename action" },
}, { prefix = "<space>" })

wk.register({
  gd = { "go to definition" },
  gi = { "go to implementation" },
  gD = { "go to declaration" },
  K = { "open modal hover" },
})

keymap("n", "<space>de", vim.diagnostic.open_float, opts)
keymap("n", "<space>d[", vim.diagnostic.goto_prev, opts)
keymap("n", "<space>d]", vim.diagnostic.goto_next, opts)
keymap("n", "<space>dq", vim.diagnostic.setloclist, opts)
keymap("n", "<space>dt", ":Trouble<cr>", opts)

-- file explorer
keymap("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")

-- Float Term --

g.floaterm_keymap_toggle = "<space>to"
g.floaterm_gitcommit = "floaterm"
g.floaterm_autoinsert = 1
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_wintitle = 0
g.floaterm_autoclose = 1

-- UltiSnips
g.UltiSnipsExpandTrigger = "<M-a>"
g.UltiSnipsJumpForwardTrigger = "<tab>"
g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
g.UltiSnipsListSnippets = "<space>sl"

keymap("n", "<space>sa", ":UltiSnipsAddFileTypes", opts)
keymap("n", "<space>se", ":UltiSnipsEdit<cr>", opts)

-- "emmet-vim
g.user_emmet_mode = "a"
g.user_emmet_leader_key = "<C-a>"

-- comment
keymap("n", "<C-c>", "<cmd>:CommentToggle<CR>")

-- telescope --
--

keymap("n", "<space>tf", "<cmd>:Telescope find_files<CR>")
keymap("n", "<space>tt", "<cmd>:Telescope live_grep<CR>")
keymap("n", "<space>tb", "<cmd>:Telescope buffers<CR>")
keymap("n", "<space>th", "<cmd>:Telescope help_tags<CR>")
keymap("n", "<space>tc", "<cmd>:Telescope neoclip<CR>")
keymap("n", "<space>tm", "<cmd>:Telescope media_files<CR>")

-- git
keymap("n", "<space>gd", ":Neogit<cr>")

-- Todos --
keymap("n", "<space>nl", "<cmd>:TodoQuickFix<CR>")
keymap("n", "<space>nt", "<cmd>:Telekasten<CR>")

-- Clear highlights
keymap("n", "<C-l>", "<cmd>noh<CR>")

-- save
keymap("n", "<C-s>", "<cmd>:w<CR>")

-- quit
keymap("n", "<C-q>", "<cmd>:q<CR>")

-- Split window
keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")

-- Use alt + hjkl to resize windows
keymap("n", "<C-M-Down>", "<cmd>:resize -2<CR>")
keymap("n", "<C-M-Up>", "<cmd>:resize +2<CR>")
keymap("n", "<C-M-Left>", "<cmd>:vertical resize -2<CR>")
keymap("n", "<C-M-Right>", "<cmd>:vertical resize +2<CR>")

-- Use alt + hjkl to move into windows
keymap("n", "<C-Left>", "<C-w>h")
keymap("n", "<C-Down>", "<C-w>j")
keymap("n", "<C-Up>", "<C-w>k")
keymap("n", "<C-Right>", "<C-w>l")

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Make <C-u> undo-friendly
keymap("", "<C-z>", "<C-g>u<C-u>")

-- Make <C-u> undo-friendly
keymap("", "<C-m-z>", "<cmd>:redo<cr>")

-- restart vim config
keymap("n", "rc", "<cmd>:source ~/.config/nvim/init.lua<cr>")
