local themes_table = {
	"gruvbox",
	"gruvbox-material",
	"kanagawa",
	"kanagawa-dragon",
	"kanagawa",
	"everforest",
	"catppuccin-macchiato",
	"catppuccin-frappe",
}

local get_random_theme = function()
	math.randomseed(os.time())
	local selected_index = math.random(1, #themes_table)
	local selected_theme = themes_table[selected_index]
	return selected_theme
end

local theme = get_random_theme()
print("theme ", theme)

vim.cmd("colorscheme " .. theme)
