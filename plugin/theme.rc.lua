local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')

-- local status, vscode = pcall(require, "vscode")
-- if not status then
-- 	return
-- end
-- vscode.setup({
-- 	-- Enable transparent background
-- 	transparent = false,
--
-- 	-- Enable italic comment
-- 	italic_comments = true,
--
-- 	-- Disable nvim-tree background color
-- 	disable_nvimtree_bg = true,
--
-- 	-- Override colors (see ./lua/vscode/colors.lua)
-- 	color_overrides = {
-- 		vscLineNumber = "#FFFFFF",
-- 	},
--
-- 	-- Override highlight groups (see ./lua/vscode/theme.lua)
-- 	group_overrides = {
-- 		-- this supports the same val table as vim.api.nvim_set_hl
-- 		-- use colors from this colorscheme by requiring vscode.colors!
-- 		Cursor = { fg = vscode.vscDarkBlue, bg = vscode.vscLightGreen, bold = true },
-- 	},
-- })
--
-- cmd 'colorscheme pinkmare'
-- cmd 'colorscheme onebuddy'
-- cmd("colorscheme onebuddy")
cmd("colorscheme gruvbox")
-- cmd 'colorscheme everblush'
-- require('colorbuddy').colorscheme('onebuddy')
-- cmd 'hi Normal guibg=NONE ctermbg=NONE';

-- -- Set cursor line color on visual mode
cmd([[highlight Visual cterm=NONE ctermbg=235 ctermfg=NONE guibg=Grey39]])
-- cmd([[highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000]]) -- cmd [[highlight Visual cterm=NONE ctermbg=235 ctermfg=NONE guibg=Grey40]]
