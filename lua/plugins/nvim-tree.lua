return {
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sort_by = "name",
			update_cwd = true,
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = false,
				number = true,
				relativenumber = true,
				signcolumn = "yes",
				mappings = {
					custom_only = false,
					list = {},
				},
			},
		},
	},
}
