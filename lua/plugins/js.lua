local BufCommands = {
	"BufEnter *.tsx",
	"BufEnter *.jsx",
	"BufEnter *.ts",
	"BufEnter *.js",
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
}
