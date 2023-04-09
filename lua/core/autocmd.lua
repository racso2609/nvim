local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

cmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlightyank", {
		clear = true,
	}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	vim.cmd(":NvimTreeOpen<cr>")
	-- vim.cmd("lua require('telescope.builtin').find_files({cwd =vim.fn.systemlist('git rev-parse --show-toplevel')[1]})")
end

cmd("VimEnter", { callback = open_nvim_tree })
