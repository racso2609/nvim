local wk = racsonvim.safeRequire("which-key")
local mappings = {
	f = {
		name = "focus mode",
	},
}

wk.register(mappings, { prefix = "<leader>" })

return {
	{
		"folke/twilight.nvim",
		opts = {},
		init = function()
			-- vim.cmd(":Twilight<cr>")
		end,
		keys = {
			{ "<leader>fm", ":Twilight<cr>", desc = "Toggle focus mode" },
		},
	},

	{
		"beauwilliams/focus.nvim",
		event = { "BufRead" },
		opts = {},
		init = function()
			vim.cmd(":FocusToggle<cr>")
		end,
		keys = {
			{ "<leader>fr", ":FocusToggle<cr>", desc = "Toggle auto resize" },
		},
	},

	{
		"RRethy/vim-illuminate",
		opts = {},
		config = function(_, opts)
			racsonvim.safeRequire("illuminate").configure(opts)
		end,
	},
}
