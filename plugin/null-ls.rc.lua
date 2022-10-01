local autocmd = vim.api.nvim_create_autocmd
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local null_config = {
	sources = {
		null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
		-- html
		null_ls.builtins.formatting.djlint,

		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.protolint,
		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.diagnostics.codespell.with({ filetypes = {} }),
		-- general
		null_ls.builtins.formatting.trim_newlines,
		null_ls.builtins.formatting.trim_whitespace,
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format)

			-- format on save
			autocmd("BufWritePost", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.keymap.set("v", "<Leader>f", vim.lsp.buf.range_formatting)
		end
	end,
}
null_ls.setup(null_config)
