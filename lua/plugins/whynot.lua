return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"tpope/vim-surround",
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost" },
		opts = {
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "<C-c>",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<C-c>",
				---Block-comment keymap
				block = "cb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "cO",
				---Add comment on the line below
				below = "co",
				---Add comment at the end of line
				eol = "cA",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "VeryLazy" },
		cmd = "TodoQuickFix",
		opts = {},
		keys = {
			{ "<leader>nl", ":TodoTelescope<cr>", desc = "List todo comments" },
		},
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch", "diagnostics" },
				lualine_c = { "fileformat" },
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		},
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {

			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sort_by = "name",
			update_cwd = true,
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = false,
				number = true,
				relativenumber = true,
				signcolumn = "yes",
				-- mappings = {
				-- custom_only = false,
				-- list = {},
				-- },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			local whichKey = racsonvim.safeRequire("which-key")
			if not whichKey then
				return
			end
			local mapping = {
				d = "Diagnostic",
				s = "Snippets",
				n = "notes",
				g = "git",
				l = "languages",
				t = { "telescope", c = "commands and colorschemes", f = "Files", g = "github", s = "search" },
			}

			whichKey.register(mapping, { prefix = "<leader>" })
		end,
		opts = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true, -- show a help message in the command line for using WhichKey
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specifiy a list manually
			-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
			triggers_nowait = {
				-- marks
				"`",
				"'",
				"g`",
				"g'",
				-- registers
				'"',
				"<c-r>",
				-- spelling
				"z=",
			},
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = {},
			},
		},
	},

	-- IA
	-- TODO:  create promps for document functions
	-- TODO: install ollama on a server and expose it to be used by me (or more ram XD)
	{
		"David-Kunz/gen.nvim",
		event = "VimEnter",
		opts = {
			model = "mistral", -- The default model to use.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = true, -- Shows the Prompt submitted to Ollama.
			show_model = true, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = true, -- Never closes the window automatically.
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a lua function returning a command string, with options as the input parameter.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			list_models = "<function>", -- Retrieves a list of model names
			debug = true, -- Prints errors and the command which is run.
		},
		keys = {
			{ "<leader>gc", ":Gen<cr>", desc = "Start code generation" },
		},
		init = function()
			require("gen").prompts["Generate_Documentation"] = {
				prompt = "You are a $filetype developer with 5 years of experience "
					.. "please generate the documentation to the next code"
					.. " avoid document proper $filetype functions."
					.. " Only ouput the result following the next standard ```$filetype\n "
					.. "/** \n"
					.. "* @name <Function Name> \n"
					.. "* @description <Description of the function and what it does> \n"
					.. "* @param {<Type of parameter 1>} <Parameter name 1> - <Brief description of parameter 1> \n"
					.. "* @param {<Type of parameter 2>} <Parameter name 2> - <Brief description of parameter 2> \n"
					.. "* @returns {<Return type>} - <Description of what the function returns>\n"
					.. "*/\n"
					.. "$text \n```: \n",
				replace = true,
				extract = "```$filetype\n(.-)```",
			}

			require("gen").prompts["Generate_Audit_Report"] = {
				prompt = "You are a $filetype developer with 5 years of experience please generate a audit report about this issue following the $input template: \n$text",
				replace = true,
			}
		end,
	},
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
}
