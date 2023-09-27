return {
	{
		"creativenull/efmls-configs-nvim",
		tag = "v0.1.3", -- tag is optional
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local efms = require("efmls-configs")

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

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			efms.init({
				on_attach = on_attach,
				init_options = { documentFormatting = true },
				default_options = true,
				capabilities = capabilities,
			})

			local formattersByLang = {
				typescriptreact = {
					linter = require("efmls-configs.linters.eslint"),
					formatter = require("efmls-configs.formatters.prettier"),
				},
				javascriptreact = {
					linter = require("efmls-configs.linters.eslint"),
					formatter = require("efmls-configs.formatters.prettier"),
				},

				typescript = {
					linter = require("efmls-configs.linters.eslint"),
					formatter = require("efmls-configs.formatters.prettier"),
				},
				javascript = {
					linter = require("efmls-configs.linters.eslint"),
					formatter = require("efmls-configs.formatters.prettier"),
				},
				lua = {
					linter = require("efmls-configs.linters.luacheck"),
					formatter = require("efmls-configs.formatters.stylua"),
				},
			}
			efms.setup(formattersByLang)
		end,
	},
}
