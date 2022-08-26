local autocmd = vim.api.nvim_create_autocmd
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local null_config = {
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.completion.spell,
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.keymap.set("n", "<Leader>f", vim.lsp.buf.formatting)

			-- format on save
			autocmd("BufWritePost", {
				callback = function()
					vim.lsp.buf.formatting()
				end,
			})
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.keymap.set("v", "<Leader>f", vim.lsp.buf.range_formatting)
		end
	end,
}
null_ls.setup(null_config)
