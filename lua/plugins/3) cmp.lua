return {
	{
		"Exafunction/codeium.vim",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "BufEnter",
		config = function()
			local g = vim.g
			local cmp = racsonvim.safeRequire("cmp")
			local lspkind = racsonvim.safeRequire("lspkind")
			-- UltiSnips
			g.UltiSnipsExpandTrigger = "<M-a>"
			g.UltiSnipsJumpForwardTrigger = "<tab>z"
			g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
			g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
			g.UltiSnipsListSnippets = "<space>sl"
			--
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<M-a>"] = cmp.mapping(function(fallback)
						cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
					end, {
						"i",
						"s", --[[ "c" (to enable the mapping in command mode) ]]
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						cmp_ultisnips_mappings.jump_backwards(fallback)
					end, {
						"i",
						"s", --[[ "c" (to enable the mapping in command mode) ]]
					}),
				}),
				formatting = {
					format = lspkind.cmp_format(),
				},
				sources = cmp.config.sources({
					{
						name = "path",
					},
					{
						name = "nvim_lsp",
						keyword_length = 3,
					},
					{
						name = "cmp_tabnine",
						keyword_length = 3,
					},
					{
						name = "ultisnips",
						keyword_length = 2,
					}, -- For ultisnips users.
					{
						name = "buffer",
					},
					{
						name = "nvim_lsp_signature_help",
					},
					{
						name = "plugins",
					},
				}),
			})
			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{
						name = "cmp_git",
					}, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{
						name = "buffer",
					},
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{
						name = "cmp_git",
					}, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{
						name = "buffer",
					},
				}),
			})

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{
						name = "buffer",
					},
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{
						name = "path",
					},
				}, {
					{
						name = "cmdline",
					},
				}),
			})
		end,
		dependencies = {
			{
				"onsails/lspkind-nvim",
				opts = {
					preset = "codicons",
					mode = "symbol_text",
				},
				config = function(_, opts)
					local lspkind = racsonvim.safeRequire("lspkind")
					lspkind.init(opts)
				end,
			},
			"hrsh7th/cmp-nvim-lsp",
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = function()
					-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
				end,
				dependencies = {
					{
						"SirVer/ultisnips",
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	},
}
