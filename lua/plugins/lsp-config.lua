return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		keys = {
			{ "<leader>D", vim.lsp.buf.type_definition, desc = "Type definition" },
			{ "<leader>r", vim.lsp.buf.rename, desc = "Rename variables" },
			{ "<C-k>", vim.lsp.buf.hover, desc = "open hover help" },
			{ "K", vim.lsp.buf.signature_help, desc = "open help" },
			{ "gd", vim.lsp.buf.definition, desc = "Goto definition" },
			{ "gD", vim.lsp.buf.declaration, desc = "go to declaration" },
			{ "gi", vim.lsp.buf.implementation, desc = "go to implementation" },
		},
	},
}
