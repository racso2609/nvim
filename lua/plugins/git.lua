local wk = racsonvim.safeRequire("which-key")
local mappings = {
	name = "Git",
	D = "Different",
}

wk.register(mappings, { prefix = "<leader>g" })

return {
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		opt = {},
		config = function(opt)
			require("neogit").setup(opt)
		end,
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
