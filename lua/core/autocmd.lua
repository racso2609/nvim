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

local format_sync_grp = vim.api.nvim_create_augroup("JsFormat", {})
cmd("BufWritePre", {
	pattern = { "*.ts", "*.js", "*.tsx", "*.jsx", "*.cjs", "*.mjs" },
	group = format_sync_grp,
	callback = function()
		vim.cmd("lua require('typescript').actions.addMissingImports()")
		vim.cmd("lua require('typescript').actions.removeUnused()")
	end,
})

local function open_nvim_tree(data)
	racsonvim.notify("hello mother fucker", "info")
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

cmd("VimEnter", { callback = open_nvim_tree })
