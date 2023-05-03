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
}
