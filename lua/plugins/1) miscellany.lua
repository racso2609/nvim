return {
	{
		"rcarriga/nvim-notify",
		init = function()
			vim.notify = require("notify")
		end,
	},
	{ "racso2609/keymaps-nvim", lazy = false },
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
			local wk = racsonvim.safeRequire("which-key")
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
	-- dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = racsonvim.safeRequire("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[▀███▀▀▀██▄       ██       ▄▄█▀▀▀█▄█▄█▀▀▀█▄█ ▄▄█▀▀██▄ ]],
				[[  ██   ▀██▄     ▄██▄    ▄██▀     ▀███    ▀███▀    ▀██]],
				[[  ██   ▄██     ▄█▀██▄   ██▀       ▀███▄   ██▀      ▀█]],
				[[  ███████     ▄█  ▀██   ██          ▀█████▄█        █]],
				[[  ██  ██▄     ████████  ██▄       ▄     ▀███▄      ▄█]],
				[[  ██   ▀██▄  █▀      ██ ▀██▄     ▄▀█     ████▄    ▄██]],
				[[▄████▄ ▄███▄███▄   ▄████▄ ▀▀█████▀█▀█████▀  ▀▀████▀▀ ]],
			}

			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButton"

			local function footer()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return "   Have Fun with neovim"
					.. "   v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
					.. "   "
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
			end

			dashboard.section.footer.val = footer()
			dashboard.section.footer.opts.hl = "AlphaFooter"

			local head_butt_padding = 2
			local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
			local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
			local foot_butt_padding = 1
			dashboard.config.layout = {
				{ type = "padding", val = header_padding },
				dashboard.section.header,
				{ type = "padding", val = head_butt_padding },
				dashboard.section.buttons,
				{ type = "padding", val = foot_butt_padding },
				dashboard.section.footer,
			}
			alpha.setup(dashboard.opts)
		end,
	},
	"dstein64/vim-startuptime",
}
