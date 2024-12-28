local cmd = vim.api.nvim_create_autocmd

local BufCommands = {
	"BufEnter *.tsx",
	"BufEnter *.jsx",
	"BufEnter *.ts",
	"BufEnter *.js",
	"BufEnter *.mdx",
}

return {
	-- general
	-- {
	-- "nathom/filetype.nvim",
	-- opt = {},
	-- },
	-- ts/js
	{
		"jose-elias-alvarez/typescript.nvim",
		event = BufCommands,
		opts = {},
		keys = {
			{
				"<leader>ai",
				":lua require('typescript').actions.addMissingImports()<cr>",
				desc = "Add missing imports",
			},
			{
				"<leader>ri",
				":lua require('typescript').actions.removeUnused()<cr>",
				desc = "Remove unused imports",
			},
		},
		init = function()
			local format_sync_grp = vim.api.nvim_create_augroup("JsFix", {})
			cmd("BufWritePost", {
				pattern = { "*.ts", "*.js", "*.tsx", "*.jsx", "*.cjs", "*.mjs" },
				group = format_sync_grp,
				callback = function()
					require("typescript").actions.addMissingImports()
					-- require("typescript").actions.removeUnused()
				end,
			})
		end,
		dependencies = {
			-- { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" }, event = BufCommands },
			{
				"mlaursen/vim-react-snippets",
				lazy = true,
				event = BufCommands,
			},
			{
				"styled-components/vim-styled-components",
				lazy = true,
				event = BufCommands,
			},
		},
	},
	-- yuck (eww)
	{ "elkowar/yuck.vim", event = { "BufRead *.yuck" } },
	--  markdown
	--  higlight
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		-- lazy = true,
		-- ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = { enable = false },
			workspaces = {
				{
					name = "personal",
					path = "~/notes/personal",
				},
				{
					name = "work",
					path = "~/notes/work",
				},
			},

			-- see below for full list of optional dependencies 👇
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- {
	-- 	"toppair/peek.nvim",
	-- 	build = "deno task --quiet build:fast",
	-- 	event = { "VeryLazy" },
	-- 	config = function(opts)
	-- 		require("peek").setup(opts)
	-- 		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
	-- 		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	-- 	end,
	-- 	opts = {
	-- 		auto_load = true, -- whether to automatically load preview when
	-- 		-- entering another markdown buffer
	-- 		close_on_bdelete = true, -- close preview window on buffer delete
	-- 		syntax = true, -- enable syntax highlighting, affects performance
	-- 		theme = "dark", -- 'dark' or 'light'
	-- 		update_on_change = true,
	-- 		app = "browser", -- 'webview', 'browser', string or a table of strings
	-- 		-- explained below
	--
	-- 		filetype = {
	-- 			"markdown",
	-- 		}, -- list of filetypes to recognize as markdown
	-- 		-- relevant if update_on_change is true
	-- 		throttle_at = 200000, -- start throttling when file exceeds this
	-- 		-- amount of bytes in size
	-- 		throttle_time = "auto", -- minimum amount of time in milliseconds
	-- 		-- that has to pass before starting new render
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<space>np",
	-- 			":lua require('peek').open()<cr>",
	-- 			desc = "Note preview",
	-- 		},
	-- 	},
	-- },
	-- cairo
	{
		"ericglau/vim-cairo",
		lazy = true,
		event = {
			"BufEnter *.cairo",
		},
		dependencies = {
			"miguelmota/cairo.vim",
			{
				"racso2609/cairo-support-nvim",
				event = {
					"BufEnter *.cairo",
				},
				opts = {
					format = true,
					compile = true,
					environment = "nexera_cairo",
				},
			},
		},
	},
	-- solidity
	{ "tomlion/vim-solidity" },
}
