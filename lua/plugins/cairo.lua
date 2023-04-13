return {
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
				opts = {
					format = true,
					compile = true,
					environment = "nexera_cairo",
				},
			},
		},
	},
}
