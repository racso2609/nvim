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

-- cmd({ "BufReadPost", "BufNewFile" }, {
-- 	callback = function(ev)
-- 		local status, filetype = pcall(vim.filetype.match, { buf = ev.bufnr })
--
-- 		if not status then
-- 			vim.notify("Error: " .. filetype, "error")
-- 			return
-- 		end
--
-- 		vim.notify("Buffer: " .. ev.bufnr, "info")
-- 		vim.notify("Filetype: " .. filetype, "info")
--
-- 		vim.cmd("set filetype=" .. filetype)
-- 	end,
-- })
