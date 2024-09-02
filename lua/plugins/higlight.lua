return {
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		event = {
			"BufRead",
		},
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"YongJieYongJie/tree-sitter-solidity",
			-- "JoosepAlviste/nvim-ts-context-commentstring",
			-- "nvim-treesitter/nvim-treesitter-context",
			-- "nvim-treesitter/nvim-treesitter-textobjects",
			{
				"windwp/nvim-ts-autotag",
				config = function()
					racsonvim.safeRequire("nvim-ts-autotag").setup({
						enable = true,
					})
				end,
			},
		},
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"solidity",
				"javascript",
				"typescript",
				"tsx",
				"rust",
				"http",
				"json",
				"yaml",
				"bash",
			},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true, -- false will disable the whole extension
				-- disable = { 'json' }, -- list of language that will be disabled
			},
			indent = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			racsonvim.safeRequire("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		init = function()
			local highlight = {
				"CursorColumn",
				"Whitespace",
			}
			require("ibl").setup({
				indent = { highlight = highlight, char = "" },
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
			})
		end,
	},
}
