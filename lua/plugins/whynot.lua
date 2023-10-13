return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"tpope/vim-surround",
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost" },
		opts = {
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "<C-c>",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<C-c>",
				---Block-comment keymap
				block = "cb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "cO",
				---Add comment on the line below
				below = "co",
				---Add comment at the end of line
				eol = "cA",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "VeryLazy" },
		cmd = "TodoQuickFix",
		opts = {},
		keys = {
			{ "<leader>nl", ":TodoTelescope<cr>", desc = "List todo comments" },
		},
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch", "diagnostics" },
				lualine_c = { "fileformat" },
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		},
	},
	-- {
		-- "folke/which-key.nvim",
		-- event = "VeryLazy",
		-- init = function()
			-- vim.o.timeout = true
			-- vim.o.timeoutlen = 300
		-- end,
	-- },
}
