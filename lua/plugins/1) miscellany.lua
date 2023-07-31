return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		init = function()
			vim.notify = require("notify")
		end,
	},
	{ "racso2609/keymaps-nvim", event = "VeryLazy" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{ "rcarriga/nvim-notify", opt = { background_color = "#000000" } },
		},
		keys = {
			{ "<leader>q", "<cmd>NoiceDismiss<cr>", desc = "Close noice" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },

		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			show_trailing_blankline_indent = true,
			show_current_context = true,
		},
		config = function(opts)
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup(opts)
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
			local wk = racsonvim.safeRequire("which-key")
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
	"dstein64/vim-startuptime",
}
