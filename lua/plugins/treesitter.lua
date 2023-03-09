return {
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"YongJieYongJie/tree-sitter-solidity",
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup({})
				end,
			},
		},
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "rust", "lua", "javascript", "typescript" },
			highlight = {
				enable = true, -- false will disable the whole extension
				-- disable = { 'json' }, -- list of language that will be disabled
			},

			indent = { enable = true },
			autopairs = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
			},
			autotag = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
