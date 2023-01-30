local telescope = racsonvim.safeRequire("telescope")

telescope.setup({
	defaults = {
		path_display = { "smart" },
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})
telescope.load_extension("media_files")
telescope.load_extension("neoclip")
local neoclip = racsonvim.safeRequire("neoclip")
neoclip.setup({})
