return {
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
		event = { "BufEnter" },
		opts = {},
	},
}
