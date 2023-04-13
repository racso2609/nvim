local foldersTable = {
	"core",
	"core.base",
	"core.plugin",
	"core.autocmd",
	"core.keymaps",
}

for _, folder in ipairs(foldersTable) do
	local status, fail = pcall(require, folder)
	if not status then
		vim.api.nvim_err_writeln("Failed to load " .. folder .. "\n\n" .. fail)
	end
end

if vim.fn.has("nvim-0.8") ~= 1 or vim.version().prerelease then
	vim.schedule(function()
		racsonvim.notify("Unsupported Neovim Version! Please check the requirements", "error")
	end)
end
