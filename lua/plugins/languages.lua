local cmd = vim.api.nvim_create_autocmd

local BufCommands = {
	"BufEnter *.tsx",
	"BufEnter *.jsx",
	"BufEnter *.ts",
	"BufEnter *.js",
	"BufEnter *.mdx",
}

return {
	{
		"jose-elias-alvarez/typescript.nvim",
		event = BufCommands,
		opts = {},
		init = function()
			local format_sync_grp = vim.api.nvim_create_augroup("JsFix", {})
			cmd("BufWritePost", {
				pattern = { "*.ts", "*.js", "*.tsx", "*.jsx", "*.cjs", "*.mjs" },
				group = format_sync_grp,
				callback = function()
					vim.cmd("lua require('typescript').actions.addMissingImports()")
					vim.cmd("lua require('typescript').actions.removeUnused()")
				end,
			})
		end,
		dependencies = {
			-- { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" }, event = BufCommands },
			{
				"mlaursen/vim-react-snippets",
				lazy = true,
				event = BufCommands,
			},
			{
				"styled-components/vim-styled-components",
				lazy = true,
				event = BufCommands,
			},
		},
	},
}
