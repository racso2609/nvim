-- local is_available = racsonvim.is_available
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- local create_command = vim.api.nvim_create_user_command

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
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
