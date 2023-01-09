local cairo = racsonvim.safeRequire("cairo-support-nvim")

cairo.setup({
	format = true,
	compile = true,
	environment = "nexera_cairo",
})
