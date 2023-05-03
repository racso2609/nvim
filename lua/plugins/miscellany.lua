local wk = racsonvim.safeRequire("which-key")
return {
	"racso2609/keymaps-nvim",
	"folke/which-key.nvim",
	{ "lukas-reineke/indent-blankline.nvim", event = { "BufRead" } },
	-- minimap
	{
		"gorbit99/codewindow.nvim",
		event = "BufRead",
		opts = {},
		keys = {
			{ "<leader>mt", ":lua require('codewindow').toggle_minimap()<cr>", desc = "Toggle minimap" },
		},
		init = function()
			local mappings = {
				name = "Minimap",
			}
			wk.register(mappings, { prefix = "<space>m" })
		end,
	},
	-- session manager
	{
		"olimorris/persisted.nvim",
		config = true,
		init = function()
			local mappings = {
				name = "Session manager",
			}
			wk.register(mappings, { prefix = "<space>S" })
		end,
		keys = {
			{ "<leader>Sa", ":SessionSave <cr>", desc = "save current session" },
			{ "<leader>Sd", ":SessionDelete <cr>", desc = "save curtrent session" },
		},
	},

	-- movement line
	{
		"fedepujol/move.nvim",
		keys = {
			{ "<S-Up>", ":MoveLine -1<cr>", desc = "Move lines to up" },
			{ "<S-Down>", ":MoveLine 1<cr>", desc = "Move lines to up" },
		},
	},
}
