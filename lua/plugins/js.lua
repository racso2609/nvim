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
		"styled-components/vim-styled-components",
		lazy = true,
		event = BufCommands,
	},
	{
		"mlaursen/vim-react-snippets",
		lazy = true,
		event = BufCommands,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
		event = BufCommands,
		opts = {},
	},
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" }, event = BufCommands },
}
