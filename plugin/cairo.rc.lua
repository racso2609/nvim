-- local autocmd = vim.api.nvim_create_autocmd
-- local CAIRO_BASE_URI = "/home/racso/Work/nexera/MetaNFT-Cairo/"
local status, cairo = pcall(require, "cairo-support-nvim")
if not status then
	return
end
cairo.setup({
	format = true,
	compile = true,
})
-- g.coc_start_at_startup = false

-- autocmd("BufWritePost", {
-- 	pattern = "*.cairo",
-- 	callback = function()
-- 		print("cairo")
-- 		vim.cmd("!cd " .. CAIRO_BASE_URI)
--
-- 		local completeFilePath = vim.fn.expand("%:p")
-- 		local filePath = string.sub(completeFilePath, 39)
-- 		print(filePath)
-- 		vim.cmd("!starknet-compile " .. filePath)
-- 	end,
-- })

-- autocmd("FileWritePost", {
-- 	pattern = "cairo",
-- 	callback = function()
-- 		print("cairo")
-- 		local filePath = vim.fn.expand("%:p")
-- 		vim.cmd("!protostar build " .. filePath)
-- 	end,
-- })
