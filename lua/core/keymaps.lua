-- leader key
local g = vim.g

local opts = { remap = true, silent = true }
-- snippets
racsonvim.setKeymap("n", "<leader>sa", "<cmd>UltiSnipsAddFileTypes<cr>", opts, "Add snippet fileType")
racsonvim.setKeymap("n", "<leader>se", "<cmd>UltiSnipsEdit<cr>", opts, "Edit snippet file type")

local toggleRelativeNumber = function()
	vim.opt.relativenumber = not vim.wo.relativenumber
end
-- toggle relative number
racsonvim.setKeymap("n", "<C-N>", toggleRelativeNumber, opts, "Toggle relative line number")

-- note taking
racsonvim.setKeymap(
	"n",
	"<leader>nf",
	"lua require('telescope.builtin').find_files({cwd =" .. "'/home/racso/notes'})",
	opts,
	"Fuzzy find notes"
)

-- NvimTree
racsonvim.setKeymap("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", opts, "Open file explorer")

-- basic
racsonvim.setKeymap("n", "<C-l>", ":noh<cr>", opts, "Clear highlights")
racsonvim.setKeymap("n", "<C-s>", "<cmd>w!<cr>", opts, "save")
racsonvim.setKeymap("n", "<C-q>", "<cmd>q<cr>", opts, "close")
racsonvim.setKeymap("n", "<C-a>", "gg<S-v>G", opts, "select all")
racsonvim.setKeymap("n", "<C-z>", "<cmd>undo<cr>", opts, "select all")
racsonvim.setKeymap("n", "<C-M-z>", "<cmd>redo<cr>", opts, "select all")

--resize windows
--- vertical
racsonvim.setKeymap("n", "<C-M-Down>", "<cmd>resize -2<cr>", opts, "resize Down")
racsonvim.setKeymap("n", "<C-M-Up>", "<cmd>resize +2<cr>", opts, "resize Up")
--- horizontal
racsonvim.setKeymap("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", opts, "resize Left")
racsonvim.setKeymap("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", opts, "resize Right")

-- move from buffers
----- vertical
racsonvim.setKeymap("n", "<C-Down>", "<C-w>j", opts, "move Down")
racsonvim.setKeymap("n", "<C-Up>", "<C-w>k", opts, "move Up")

--- horizontal
racsonvim.setKeymap("n", "<C-Left>", "<C-w>h", opts, "move Left")
racsonvim.setKeymap("n", "<C-Right>", "<C-w>l", opts, "move Right")
-- ident
racsonvim.setKeymap("v", "<Tab>", ">", opts, "ident selected")
racsonvim.setKeymap("v", "<C-Tab>", "<", opts, "unident selected")

racsonvim.setKeymap("n", "<Tab>", ">%", opts, "ident matching")
racsonvim.setKeymap("n", "<S-Tab>", "<%", opts, "unident matching")

-- formatting
racsonvim.setKeymap("n", "<C-f>", function()
	vim.lsp.buf.format({ name = "efm" })
end, opts, "move Right")

g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
g.UltiSnipsListSnippets = "<space>sl"
vim.g.UltiSnipsExpandTrigger = "<tab>"

-- remove command that i didnt user

vim.keymap.del("n", "yS")
vim.keymap.del("n", "ySs")
vim.keymap.del("n", "ySS")
vim.keymap.del("n", "yss")
vim.keymap.del("n", "ys")
