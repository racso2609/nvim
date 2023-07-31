local configNullLs = function()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	-- local code_actions = null_ls.builtins.code_actions
	local completion = null_ls.builtins.completion
	local diagnostics = null_ls.builtins.diagnostics

	local sources = {
		--[[ formatting ]]
		formatting.autopep8,
		formatting.stylua,
		formatting.clang_format,
		formatting.stylua,
		formatting.prettier,
		formatting.eslint,
		formatting.phpcbf,
		formatting.trim_newlines,
		formatting.trim_whitespace,
		formatting.rustfmt,
		formatting.black,

		--[[ code actions ]]
		-- code_actions.eslint,
		-- code_actions.ltrs,

		-- spell
		completion.spell,
		diagnostics.codespell,
		diagnostics.solhint,
		diagnostics.flake8,
		diagnostics.eslint.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),
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
		dependencies = { { "lukas-reineke/lsp-format.nvim", opt = {} } },
	},
}
