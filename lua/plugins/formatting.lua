return {
	{
		"creativenull/efmls-configs-nvim",
		tag = "v0.1.3", -- tag is optional
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local efms = require("efmls-configs")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			efms.init({
				on_attach = racsonvim.on_attach,
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
				-- solidity = {
				-- 	linter = require("efmls-configs.linters.slither"),
				-- 	formatter = require("efmls-configs.formatters.forge_fmt"),
				-- },
			}
			print("configuring")
			efms.setup(formattersByLang)
		end,
	},
}
