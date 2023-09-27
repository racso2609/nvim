local themes_table = {
 	"gruvbox-material",
 	"space-vim-dark",
 	"onedark",
}
 
 local get_random_theme = function()
 	math.randomseed(os.time())
 	local selected_index = math.random(1, #themes_table)
 	local selected_theme = themes_table[selected_index]
 	return selected_theme
 end
 
 local theme = get_random_theme()
 local set_theme = function()
 	vim.cmd("colorscheme " .. theme)
 end
 
 vim.api.nvim_create_autocmd("VimEnter", { callback = set_theme })
