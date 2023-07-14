return {
	{
		"NvChad/nvterm",
		opts = {
			terminals = {
				shell = vim.o.shell,
				list = {},
				type_opts = {
					float = {
						relative = "editor",
						row = 0.1,
						col = 0.2,
						width = 0.7,
						height = 0.7,
						border = "single",
					},
					horizontal = { location = "rightbelow", split_ratio = 0.3 },
					vertical = { location = "rightbelow", split_ratio = 0.5 },
				},
			},
			behavior = {
				autoclose_on_quit = {
					enabled = true,
					confirm = true,
				},
				close_on_exit = true,
				auto_insert = true,
			},
		},
		keys = {
			{
				"<A-i>",
				'<cmd>lua require("nvterm.terminal").toggle("float")<cr>',
				desc = "Toggle nvterm",
			},
		},
	},
}
