return {
	{
		"nvim-telescope/telescope.nvim",
		version = false, -- telescope did only one release, so use HEAD for now
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = false },
			"nvim-telescope/telescope-media-files.nvim",
			"AckslD/nvim-neoclip.lua",
			"BurntSushi/ripgrep",
		},
		branch = "0.1.x",
		cmd = "Telescope",
		keys = {
			--buffers
			{
				"<leader>tb",
				"<cmd>Telescope buffers show_all_buffers=true<cr>",
				desc = "Switch Buffer",
			},
			-- Grep Search
			{
				"<leader>tT",
				":lua require('telescope.builtin').live_grep()<cr>",
				desc = "Find in Files (Grep)",
			},
			{
				"<leader>tt",
				":lua require('telescope.builtin').live_grep({cwd=vim.fn.systemlist('git rev-parse --show-toplevel')[1]})<cr>",
				desc = "Grep (cwd)",
			},
			-- Search Files
			{
				"<leader>tfF",
				":lua require('telescope.builtin').find_files()<cr>",
				desc = "Search file on actual dir",
			},
			{
				"<leader>tff",
				":lua require('telescope.builtin').find_files({cwd =vim.fn.systemlist('git rev-parse --show-toplevel')[1]})<cr>",
				desc = "Search file on root dir",
			},
			{
				"<leader>tfr",
				"<cmd>Telescope oldfiles<cr>",
				desc = "Recent",
			},
			--	-- git
			{
				"<leader>tgc",
				"<cmd>Telescope git_commits<CR>",
				desc = "commits",
			},
			{
				"<leader>tgs",
				"<cmd>Telescope git_status<CR>",
				desc = "status",
			},

			--	-- search
			{
				"<leader>tsb",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Buffer",
			},
			{
				"<leader>tsd",
				"<cmd>Telescope diagnostics<cr>",
				desc = "Diagnostics",
			},
			{
				"<leader>tcs",
				"<cmd>Telescope colorscheme<cr>",
				desc = "Colorscheme",
			},
			{
				"<leader>tch",
				"<cmd>Telescope command_history<cr>",
				desc = "Command History",
			},
			{
				"<leader>tcc",
				"<cmd>Telescope commands<cr>",
				desc = "Commands",
			},
			-- sessions
			{
				"<leader>tS",
				"<cmd>Telescope persisted<cr>",
				desc = "Commands",
			},
		},
		opts = {
			defaults = {
				path_display = {
					"smart",
				},
			},
			extensions = {
				persisted = {
					layout_config = { width = 0.55, height = 0.55 },
				},
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = {
						"png",
						"webp",
						"jpg",
						"jpeg",
					},
					find_cmd = "rg", -- find command (defaults to `fd`)
				},
				lazy = {
					-- Optional theme (the extension doesn't set a default theme)
					theme = "ivy",
					-- Whether or not to show the icon in the first column
					show_icon = true,
				},
			},
		},

		init = function()
			local telescope = racsonvim.safeRequire("telescope")
			local whichKey = racsonvim.safeRequire("which-key")

			local mapping = {
				t = {
					name = "telescope",
					f = {
						name = "Find file",
						f = "Find file on root project",
						F = "Find file on current directory",
						r = "Find recent files",
					},
					b = "Search buffer",
					S = "Load saved sessions",
					t = "Grep in root project",
					T = "Grep in actual directory",
					c = { name = "Commands", c = "List commands", h = "Command history", s = "Color scheme" },
					g = { name = "Github", c = "Search commits", s = "Search edited files" },
					s = { name = "Search", b = "Search on current buffer", d = "Search diagnostic on current file" },
				},
			}

			whichKey.register(mapping, { prefix = "<leader>" })

			telescope.load_extension("persisted")
			telescope.load_extension("neoclip")
			telescope.load_extension("media_files")
		end,
	},
}
