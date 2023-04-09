return {
	"nvim-tree/nvim-web-devicons",
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {},
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
				mappings = {
					custom_only = false,
					list = {},
				},
			},
		},
	},
}
