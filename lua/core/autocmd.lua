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
-- vim

cmd({ "BufReadPost", "BufNewFile" }, {
	callback = function(ev)
		local filetype = vim.filetype.match({ buf = ev.bufnr })
		vim.notify("Buffer: " .. ev.bufnr, "info")
		vim.notify("Filetype: " .. filetype, "info")

		vim.cmd("set filetype=" .. filetype)
	end,
})
