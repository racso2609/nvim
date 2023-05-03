local wk = racsonvim.safeRequire("which-key")
local mappings = {
	name = "Git",
	D = "Different",
}

wk.register(mappings, { prefix = "<leader>g" })

return {
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function() end,
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
