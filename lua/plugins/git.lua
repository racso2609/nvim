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
	},
	-- TODO: check commands
	"sindrets/diffview.nvim",
}
