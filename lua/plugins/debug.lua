return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				-- opt = {},
				config = function()
					-- require("dap").setup({})
				end,
			},
		},
		config = function()
			require("dapui").setup({
				icons = {
					expanded = "⯆",
					collapsed = "⯈",
					circular = "↺",
				},
				mappings = {
					expand = "<CR>",
					open = "o",
					remove = "d",
				},
				sidebar = {
					elements = {
						-- You can change the order of elements in the sidebar
						"scopes",
						"scopes",
						"watches",
					},
					width = 40,
					position = "left", -- Can be "left" or "right"
				},
				tray = {
					elements = {
						"repl",
					},
					height = 10,
					position = "bottom", -- Can be "bottom" or "top"
				},
			})
		end,
		keys = {
			{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Debug breakpoint" },
			{ "<leader>dn", "<cmd>lua require('dap').continue()<cr>", desc = "Debug continue" },
			{ "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Debug step into" },
			{ "<leader>do", "<cmd>lua require('dapui').open({reset= true})<cr>", desc = "Open debug" },
			{ "<leader>dc", "<cmd>lua require('dapui').close()<cr>", desc = "Close debug" },
			{ "<leader>dr", "<cmd> lua require('dapui').toggle()<cr>", desc = "toggle" },
		},
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-vscode-js").setup({
				-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
				debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
				-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
				-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
				-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
			})
			for _, language in ipairs({ "typescript", "javascript" }) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest Tests",
						-- trace = true, -- include debugger info
						runtimeExecutable = "node",
						runtimeArgs = {
							"./node_modules/jest/bin/jest.js",
							"--runInBand",
						},
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Start Chrome with "localhost"',
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
						userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
					},
				}
			end
		end,
	},
}
