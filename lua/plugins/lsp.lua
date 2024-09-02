return {
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		event = {
			"BufRead",
			"VeryLazy",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"codelldb",
				"stylua",
				"black",
				"prettier",
				"prettierd",
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
			local on_attach = racsonvim.on_attach
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local masonConfig = racsonvim.safeRequire("mason-lspconfig")
			local lspconfig = racsonvim.safeRequire("lspconfig")

			if not masonConfig or not lspconfig then
				return
			end

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
									runtime = {
										version = "LuaJIT",
									},
								},
							},
						})
					elseif server_name == "solidity_ls" then
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
						})
					else
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								rootMarkers = {
									".git/",
									".gitmodule",
								},
							},
							init_options = {
								documentFormatting = true,
								documentRangeFormatting = true,
							},
						})
					end
				end,
			})
		end,
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
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			local lspsaga = racsonvim.safeRequire("lspsaga")
			if not lspsaga then
				return
			end
			lspsaga.setup({})
		end,
		init = function()
			-- wk.register({ name = "Diagnostic" }, { prefix = "<space>d" })
		end,
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
			},
			{
				"nvim-treesitter/nvim-treesitter",
			},
		},
		keys = {
			{
				"<leader>r",
				"<cmd>Lspsaga rename<CR>",
				desc = "Rename function",
			},
			{
				"<leader>R",
				"<cmd>Lspsaga rename ++project<CR>",
				desc = "Rename all concurrencies",
			},
			{
				"<leader>e",
				"<cmd>Lspsaga peek_definition<CR>",
				desc = "Edit from definition",
			},
			{
				"gd",
				"<cmd>Lspsaga goto_definition<CR>",
				desc = "goTo definition",
			},
			{
				"<leader>ds",
				"<cmd>Lspsaga show_buf_diagnostics<CR>",
				desc = "show buffer diagnostic",
			},
			{
				"<leader>dS",
				"<cmd>Lspsaga show_workspace_diagnostics<CR>",
				desc = "show workspace diagnostic",
			},
		},
	},
	-- Automatically install LSPs to stdpath for neovim
	{
		"williamboman/mason.nvim",
		config = true,
	},
	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {
			log_level = vim.log.levels.TRACE,
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 10000,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				solidity = { "solhint" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettier", "prettierd" } },
				javascriptreact = { { "prettier", "prettierd" } },
				typescript = { { "prettier", "prettierd" } },
				typescriptreact = { { "prettier", "prettierd" } },
			},
		},
	},
	-- Linter
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	opts = {},
	-- 	config = function()
	-- 		local linters_by_ft = {
	-- 			-- lua = { "stylua" },
	-- 			-- Conform will run multiple formatters sequentially
	-- 			-- python = { "isort", "black" },
	-- 			-- Use a sub-list to run only the first available formatter
	-- 			javascript = { "eslint" },
	-- 			javascriptreact = { "eslint" },
	-- 			typescript = { "eslint" },
	-- 			typescriptreact = { "eslint" },
	-- 		}
	-- 		require("lint").linters_by_ft = linters_by_ft
	-- 	end,
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	-- 			callback = function()
	-- 				require("lint").try_lint()
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
