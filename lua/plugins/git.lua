return {
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>gd",
				":Neogit<cr>",
				desc = "Git commit dashboard",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufRead" },
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gDo", ":DiffviewOpen<cr>", desc = "Open diffView" },
			{ "<leader>gDc", ":DiffviewClose<cr>", desc = "Close diffView" },
		},
	},
}
