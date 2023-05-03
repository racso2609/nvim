local configNullLs = function()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local code_actions = null_ls.builtins.code_actions
	local completion = null_ls.builtins.completion
	local diagnostics = null_ls.builtins.diagnostics

	local sources = {
		--[[ formatting ]]
		formatting.eslint,
		formatting.autopep8,
		formatting.stylua,
		formatting.clang_format,
		formatting.stylua,
		formatting.stylelint,
		formatting.prettier,
		formatting.phpcbf,
		formatting.trim_newlines,
		formatting.trim_whitespace,
		--[[ code actions ]]
		code_actions.eslint_d,
		racsonvim.safeRequire("typescript.extensions.null-ls.code-actions"),

		-- spell
		completion.spell,
		diagnostics.codespell,
		diagnostics.solhint,
	}

	-- if you want to set up formatting on save, you can use this as a callback
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					racsonvim.lsp_formatting(bufnr)
				end,
			})
		end
	end

	null_ls.setup({
		debug = true,
		sources = sources,
		on_attach = on_attach,
	})
end

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		event = {
			"BufRead",
		},
		config = configNullLs,
	},
}
