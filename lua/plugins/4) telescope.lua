return {
	{
		"nvim-telescope/telescope.nvim",
		version = false, -- telescope did only one release, so use HEAD for now
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
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
				desc = "Search Buffer",
			},
			-- Grep Search
			{
				"<leader>tT",
				":lua require('telescope.builtin').live_grep()<cr>",
				desc = "Find in current directory",
			},
			{
				"<leader>tt",
				":lua require('telescope.builtin').live_grep({cwd=vim.fn.systemlist('git rev-parse --show-toplevel')[1]})<cr>",
				desc = "Find in root project",
			},
			{
				"<leader>tsb",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				desc = "Find in current buffer",
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
				desc = "Search recent file",
			},
			--	-- git
			{
				"<leader>tgc",
				"<cmd>Telescope git_commits<CR>",
				desc = "Search commits",
			},
			{
				"<leader>tgs",
				"<cmd>Telescope git_status<CR>",
				desc = "Search on modified file",
			},

			--	-- search
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
				desc = "Search commands",
			},
			-- sessions
			{
				"<leader>tS",
				"<cmd>Telescope persisted<cr>",
				desc = "Search saved sessions",
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
				name = "telescope",
				f = {
					name = "Find file",
				},
				c = { name = "Commands" },
				g = { name = "Github" },
				s = { name = "Search" },
			}

			whichKey.register(mapping, { prefix = "<leader>t" })

			telescope.load_extension("persisted")
			telescope.load_extension("neoclip")
			telescope.load_extension("media_files")
		end,
	},
}
