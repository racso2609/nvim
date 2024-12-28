return {
	-- dashboard
	{

		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},
	-- beatifull notifications and popups
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
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		init = function()
			vim.notify = require("notify")
			vim.notify("Holaaaa")
		end,
		config = function()
			require("notify").setup({
				render = "compact",
				stages = "fade_in_slide_out",
				timeout = 700,
				background_colour = "#000000",
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
			})
		end,
		keys = {
			{
				"<C-M-l>",
				':lua require("notify").dismiss()<cr>',
				{ desc = "Dismiss notification" },
			},
			-- {
			-- "<C-A>",
			-- ':lua require("notify")("holaaa 2")<cr>',
			-- { description = "Dismiss notification", noremap = true },
			-- },
		},
	},
}
