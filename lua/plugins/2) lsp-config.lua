local wk = racsonvim.safeRequire("which-key")
return {
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		event = {
			"BufRead",
			"VeryLazy",
		},
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{
				"williamboman/mason.nvim",
				config = true,
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				opts = {
					ensure_installed = {
						"codelldb",
						"stylua",
						"black",
						"prettier",
						"eslint-lsp",
						-- "solidity",
						"luaformatter",
						"typescript-language-server",
						"lua-language-server",
					},
					auto_update = true,
					run_on_start = true,
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					local on_attach = function(client, bufnr)
						-- Enable completion triggered by <c-x><c-o>
						vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
						vim.api.nvim_exec_autocmds("User", {
							pattern = "LspAttached",
						})
						-- disable lsp formatting to use null-ls
						client.server_capabilities.document_formatting = false
						client.server_capabilities.document_range_formatting = false

						-- Create a command `:Format` local to the LSP buffer
						vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
							racsonvim.lsp_formatting(bufnr)
						end, {
							desc = "Format current buffer with LSP",
						})
					end
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					local masonConfig = racsonvim.safeRequire("mason-lspconfig")
					local lspconfig = racsonvim.safeRequire("lspconfig")

					masonConfig.setup_handlers({
						function(server_name)
							if server_name == "lua_ls" then
								lspconfig[server_name].setup({
									on_attach = on_attach,
									capabilities = capabilities,
									settings = {
										Lua = {
											diagnostics = {
												globals = {
													"vim",
													"racsonvim",
												},
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
							elseif server_name == "efm" then
								lspconfig[server_name].setup({
									on_attach = on_attach,
									capabilities = capabilities,
									default_opts = {
										root_dir = lspconfig.util.root_pattern({ ".git/", "." }),
										init_options = { documentFormatting = true },
										settings = {
											rootMarkers = { ".git/", ".", "stylua.toml" },
										},
										filetypes = {
											"javascript",
											"javascriptreact",
											"javascript.jsx",
											"typescript",
											"typescript.tsx",
											"typescriptreact",
											"lua",
											"json",
											"html",
											-- "less",
											-- "scss",
											-- "css",
										},
									},
								})
							else
								lspconfig[server_name].setup({
									on_attach = on_attach,
									capabilities = capabilities,
								})
							end
						end,
					})
				end,
			},
		},
		keys = {
			{
				"gi",
				vim.lsp.buf.implementation,
				desc = "go to implementation",
			},
			{
				"<C-f>",
				racsonvim.lsp_formatting,
				desc = "format document",
			},
			{
				"<C-k>",
				vim.lsp.buf.hover,
				desc = "open hover help",
			},
			{
				"K",
				vim.lsp.buf.signature_help,
				desc = "open help",
			},
		},
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			racsonvim.safeRequire("lspsaga").setup({})
		end,
		init = function()
			wk.register({ name = "Diagnostic" }, { prefix = "<space>d" })
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
		keys = {
			{ "<leader>r", "<cmd>Lspsaga rename<CR>", desc = "Rename function" },
			{ "<leader>R", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename all concurrencies" },
			{ "<leader>e", "<cmd>Lspsaga peek_definition<CR>", desc = "Edit from definition" },
			{ "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "goTo definition" },
			{ "<leader>ds", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "show buffer diagnostic" },
			{ "<leader>dS", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "show workspace diagnostic" },
		},
	},
}
