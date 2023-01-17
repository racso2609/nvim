-- local is_available = racsonvim.is_available
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local namespace = vim.api.nvim_create_namespace
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

-- format on save
cmd("BufWritePost", {
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				if client.name == "tsserver" then
					vim.cmd(":EslintFixAll")
					return false
				end

				return true
			end,
		})
	end,
})
