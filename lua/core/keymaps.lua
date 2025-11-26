-- leader key
local g = vim.g

local opts = { remap = true, silent = true }


local toggleRelativeNumber = function()
	vim.opt.relativenumber = not vim.wo.relativenumber
end

-- toggle relative number
racsonvim.setKeymap("n", "<C-n>", toggleRelativeNumber, opts, "Toggle relative line number")

-- basic
racsonvim.setKeymap("n", "<C-l>", ":noh<cr>", opts, "Clear highlights")
racsonvim.setKeymap("n", "<C-s>", "<cmd>w!<cr>", opts, "save")
racsonvim.setKeymap("n", "<C-q>", "<cmd>q<cr>", opts, "close")
racsonvim.setKeymap("n", "<C-a>", "gg<S-v>G", opts, "select all")
racsonvim.setKeymap("n", "<C-z>", "<cmd>redo<cr>", opts, "redo")

-- select with Shift arrow (L,H)
racsonvim.setKeymap({ "n", "v" }, "L", "ve", opts, "select until end of the word")
racsonvim.setKeymap({ "n", "v" }, "H", "vb", opts, "select until start of the word")


-- formatting
racsonvim.setKeymap("n", "<C-f>", function()
	vim.lsp.buf.format({ name = "efm" })
end, opts, "move Right")
