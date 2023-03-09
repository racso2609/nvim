return {
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		-- event = { "BufReadPost", "BufNewFile", "BufEnter" },
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"windwp/nvim-ts-autotag",
				config = true,
			},
		},
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "rust", "lua", "javascript", "typescript" },
			sync_install = false,
			auto_install = true,
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
	{ "YongJieYongJie/tree-sitter-solidity", lazy = true, event = { "BufEnter *.sol" } },
}