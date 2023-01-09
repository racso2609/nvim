local mason = racsonvim.safeRequire("mason")
local masonConfig = racsonvim.safeRequire("mason-lspconfig")
local lspconfig = racsonvim.safeRequire("lspconfig")
-- local toolInstaller = racsonvim.safeRequire "mason-tool-installer"
-- toolInstaller.setup({
-- 	ensure_installed = {
-- 		"codelldb",
-- 		"stylua",
-- 		"shfmt",
-- 		"shellcheck",
-- 		"black",
-- 		"isort",
-- 		"prettierd",
-- 	},
-- 	auto_update = false,
-- 	run_on_start = true,
-- })
-- Package installation folder
-- local install_root_dir = vim.fn.stdpath "data" .. "/mason"
mason.setup()
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	-- disable lsp formatting to use null-ls
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end
local capabilities = vim.lsp.protocol.make_client_capabilities()

masonConfig.setup_handlers({
	function(server_name)
		if server_name == "efm" then
			lspconfig[server_name].setup({
				init_options = { documentFormatting = true },
				settings = {
					rootMarkers = { ".git/" },
				},
			})
		elseif server_name == "sumneko_lua" then
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim", "racsonvim" },
						},
						path = {
							"?.lua",
							"?/init.lua",
							vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
							vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
							"/usr/share/5.3/?.lua",
							"/usr/share/lua/5.3/?/init.lua",
						},

						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
		--elseif(server_name == 'efm') then
		else
			lspconfig[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
	end,
})
