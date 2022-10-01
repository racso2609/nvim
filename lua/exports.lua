local exports = {}
-- Functional wrapper for mapping custom keybindings
function exports.keymap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

exports.capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp = pcall(require, "cmp_nvim_lsp")
if status then
	exports.capabilities = cmp.update_capabilities(exports.capabilities)
end

function exports.showMessage(message)
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, { message })
	local opts = {
		relative = "cursor",
		width = 10,
		height = 2,
		col = 0,
		row = 1,
		anchor = "NW",
		style = "minimal",
	}
	local win = vim.api.nvim_open_win(buf, 0, opts)
	-- optional: change highlight, otherwise Pmenu is used
	vim.api.nvim_win_set_option(win, "winhl", "Normal:MyHighlight")
end

return exports
