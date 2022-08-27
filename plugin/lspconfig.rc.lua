local capabilities = require("exports").capabilities

local status, lspconfig = pcall(require, "lspconfig")
local installer_status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status or not installer_status then
	return
end

local keymap = vim.keymap
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	-- disable lsp formatting to use null-ls
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	keymap.set("n", "<space>r", vim.lsp.buf.rename, bufopts)
	keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
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

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
	lspconfig[server.name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
