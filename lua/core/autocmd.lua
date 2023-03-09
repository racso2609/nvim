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
