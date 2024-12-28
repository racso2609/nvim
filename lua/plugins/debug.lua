return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<space>ddb", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
			{ "<space>ddc", "<cmd>DapContinue<cr>", desc = "continue breakpoint" },
			{ "<space>ddB", "<cmd>DapStepOver<cr>", desc = "Step over" },
			{ "<space>ddC", "<cmd>DapStepOut<cr>", desc = "step out" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end

			local js_based_languages = { "typescript", "javascript", "typescriptreact" }

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
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

		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				keys = {
					"<space>dcu",
					"<cmd>lua require('dapui').toggle()<cr>",
					desc = "Toggle DAP UI",
				},
			},
			{
				"mxsdev/nvim-dap-vscode-js",
				opt = {
					-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
					debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
					-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
					adapters = {
						"chrome",
						"pwa-node",
						"pwa-chrome",
						"pwa-msedge",
						"node-terminal",
						"pwa-extensionHost",
						"node",
						"chrome",
					}, -- which adapters to register in nvim-dap
					-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
					-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
					-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
				},
			},
		},
	},
}
