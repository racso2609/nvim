return {
	"racso2609/keymaps-nvim",
	"folke/which-key.nvim",
	{ "lukas-reineke/indent-blankline.nvim", event = { "BufRead" } },
	{
		"RRethy/vim-illuminate",
		event = { "BufRead" },
		opts = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			-- delay: delay in milliseconds
			delay = 100,
			-- filetype_overrides: filetype specific overrides.
			-- The keys are strings to represent the filetype while the values are tables that
			-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
			filetype_overrides = {},
			-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
			filetypes_denylist = {
				"dirvish",
				"fugitive",
			},
			-- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
			filetypes_allowlist = {},
			-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
			-- See `:help mode()` for possible values
			modes_denylist = {},
			-- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
			-- See `:help mode()` for possible values
			modes_allowlist = {},
			-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
			-- Only applies to the 'regex' provider
			-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
			providers_regex_syntax_denylist = {},
			-- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
			-- Only applies to the 'regex' provider
			-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
			providers_regex_syntax_allowlist = {},
			-- under_cursor: whether or not to illuminate under the cursor
			under_cursor = true,
			-- large_file_cutoff: number of lines at which to use large_file_config
			-- The `under_cursor` option is disabled when this cutoff is hit
			large_file_cutoff = nil,
			-- large_file_config: config to use for large files (based on large_file_cutoff).
			-- Supports the same keys passed to .configure
			-- If nil, vim-illuminate will be disabled for large files.
			large_file_overrides = nil,
			-- min_count_to_highlight: minimum number of matches required to perform highlighting
			min_count_to_highlight = 1,
		},
		config = function(_, opts)
			racsonvim.safeRequire("illuminate").configure(opts)
		end,
	},
	-- minimap
	{
		"gorbit99/codewindow.nvim",
		event = "BufRead",
		opts = {},
		keys = {
			{ "<leader>km", ":lua require('codewindow').toggle_minimap()<cr>" },
		},
	},
	-- focus code
	{
		"folke/twilight.nvim",
		opts = {},
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
	-- session manager
	{
		"olimorris/persisted.nvim",
		config = true,
		keys = {
			{ "<leader>Sa", ":SessionSave <cr>", desc = "save curtrent session" },
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
	{
		"rest-nvim/rest.nvim",
		opts = {},
		keys = {

			{ "<leader>hr", ":RestNvim<cr>", desc = "run actual petition" },
			{ "<leader>hc", ":RestNvimPreview<cr>", desc = "get curl command" },
		},
	},
}
