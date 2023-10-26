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
	{
		"nathom/filetype.nvim",
		opt = {},
	},
	-- ts/js
	{
		"jose-elias-alvarez/typescript.nvim",
		event = BufCommands,
		opts = {},
		init = function()
			local format_sync_grp = vim.api.nvim_create_augroup("JsFix", {})
			cmd("BufWritePost", {
				pattern = { "*.ts", "*.js", "*.tsx", "*.jsx", "*.cjs", "*.mjs" },
				group = format_sync_grp,
				callback = function()
					require("typescript").actions.addMissingImports()
					require("typescript").actions.removeUnused()
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
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		events = { "BufRead *.md" },
		opts = {
			auto_load = true, -- whether to automatically load preview when
			-- entering another markdown buffer
			close_on_bdelete = true, -- close preview window on buffer delete
			syntax = true, -- enable syntax highlighting, affects performance
			theme = "dark", -- 'dark' or 'light'
			update_on_change = true,
			app = "webview", -- 'webview', 'browser', string or a table of strings
			-- explained below

			filetype = {
				"markdown",
			}, -- list of filetypes to recognize as markdown
			-- relevant if update_on_change is true
			throttle_at = 200000, -- start throttling when file exceeds this
			-- amount of bytes in size
			throttle_time = "auto", -- minimum amount of time in milliseconds
			-- that has to pass before starting new render
		},
		keys = {
			{
				"<space>np",
				":lua require('peek').open()<cr>",
				desc = "Note preview",
			},
		},
	},
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
}
