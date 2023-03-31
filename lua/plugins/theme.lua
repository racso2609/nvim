return {
	{
		"xiyaowong/nvim-transparent",
		opts = {
			enable = true, --boolean: enable transparent
			extra_groups = { --table/string: additional groups that should be clear
				-- In particular, when you set it to 'all', that means all available groups

				-- example of akinsho/nvim-bufferline.lua
				"BufferLineTabClose",
				"BufferlineBufferSelected",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineSeparator",
				"BufferLineIndicatorSelected",
			},
		},
	},
	{ "morhetz/gruvbox" },
	{ "sainnhe/gruvbox-material" },
	"rebelot/kanagawa.nvim",
	"sainnhe/everforest",
	{ "catppuccin/nvim", name = "catppuccin" },
}
