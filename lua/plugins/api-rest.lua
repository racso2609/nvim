-- TODO: "Fix rest plugin"
return {
	{
		"rest-nvim/rest.nvim",
		event = {
			"BufEnter *.http",
		},
		opts = {},
		keys = {

			{ "<leader>pr", ":RestNvim<cr>", desc = "run actual petition" },
			{ "<leader>pc", ":RestNvimPreview<cr>", desc = "get curl command" },
		},
		init = function()
			local wk = racsonvim.safeRequire("which-key")
			local mappings = {
				p = { name = "api Petitions", r = "Run request", c = "Get curl link" },
			}
			wk.register(mappings, { prefix = "<leader>" })
		end,
	},
}
