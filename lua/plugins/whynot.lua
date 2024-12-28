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
		opts = {
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				QUESTION = { icon = "?", color = "hint" },
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
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
				lualine_x = { "copilot", "encoding", "fileformat", "filetype" }, -- I added copilot here
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
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300

			local whichKey = racsonvim.safeRequire("which-key")

			if not whichKey then
				return
			end

			local mapping = {
				{ "<leader>d", desc = "Diagnostic" },
				{ "<leader>g", desc = "git" },
				{ "<leader>l", desc = "languages" },
				{ "<leader>n", desc = "notes" },
				{ "<leader>s", desc = "Snippets" },
				{ "<leader>t", desc = "telescope" },
				{ "<leader>tc", desc = "commands and colorschemes" },
				{ "<leader>tf", desc = "Files" },
				{ "<leader>tg", desc = "github" },
				{ "<leader>tgc", desc = "copilot" },
				{ "<leader>ts", desc = "search" },
				{ "<leader>c", desc = "checkpoint/harpoon" },
			}

			whichKey.add(mapping)
		end,
		opts = {},
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

			require("gen").prompts["Generate_Swagger"] = {
				prompt = "#swagger.tags=['Authentication']\n"
					.. '#swagger.summary="Login with user address and signature"\n'
					.. '#swagger.description="Authenticates a user by providing their address and a valid signature."\n'
					.. "#swagger.response[number]={description: <string>, schema:  <array>, <object>, <string>, <number> or <boolean>}\n"
					.. "#swagger.parameters['<name>']={\n"
					.. "    description: <string>\n"
					.. "}\n"
					.. "You are a $filetype developer with 5 years of experience. "
					.. "Please generate the Swagger documentation for the following code:\n\n"
					.. "```$filetype\n$text```"
					.. "return only documentation comment",
				extract = "```$filetype\n(.-)```",
			}
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			window = {
				layout = "float",
				title = "My Title",
			},
			-- See Configuration section for rest
		},
		keys = {
			{
				"<leader>tgco",
				function()
					local chat = require("CopilotChat")
					chat.toggle()
				end,
				desc = "Open copilot chat",
			},
			{
				"<leader>tgch",
				function()
					local chat = require("CopilotChat")
					chat.ask("Explain how it works.", {
						selection = require("CopilotChat.select").get_selection_lines,
					})
				end,
				desc = "CopilotChat - Explain",
				mode = { "v", "n" },
			},
			-- Show prompts actions with telescope
			{
				"<leader>tgcp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions({
						selection = require("CopilotChat.select").get_selection_lines,
					}))
				end,
				desc = "CopilotChat - Prompt actions",
				mode = { "v", "n" },
			},
			{
				"<leader>tgcc",
				function()
					local chat = require("CopilotChat")
					chat.ask("Create a commit message and title for the next changes", {

						selection = require("CopilotChat.select").gitdiff,
					})
				end,
				desc = "CopilotChat - commit message",
				mode = { "n" },
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"github/copilot.vim",
		-- // help
		-- write a documentation for this function
		--
		init = function()
			vim.keymap.set("i", "<C-h>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = true
		end,
	},
	{ "AndreM222/copilot-lualine" },
	-- movement

	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git", -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>ca", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>cl", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
			{ "<leader>cn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>cp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		},
	},
}
