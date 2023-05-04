return {
	{
		"xiyaowong/nvim-transparent",
		opts = {
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
			},
			extra_groups = {}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear },
		},
		config = function(opts)
			racsonvim.safeRequire("nvim-transparent").setup(opts)
		end,
	},
	"morhetz/gruvbox",
	"sainnhe/gruvbox-material",
	"sainnhe/everforest",
	"liuchengxu/space-vim-dark",
	"joshdick/onedark.vim",
	"EdenEast/nightfox.nvim",
}
