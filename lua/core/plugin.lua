-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind-nvim",
		},
	})

	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	use({

		"KadoBOT/cmp-plugins",
		config = function()
			require("cmp-plugins").setup({
				files = {
					".*\\.lua",
					-- default
					--
				},
			})
		end,
	})

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"p00f/nvim-ts-rainbow",
			"YongJieYongJie/tree-sitter-solidity",
		},
		run = function()
			pcall(require("nvim-treesitter.install").update({
				with_sync = true,
			}))
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines

	use({ -- "gc" to comment visual regions/lines
		"terrortylor/nvim-comment",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"folke/todo-comments.nvim",
			"renerocksai/telekasten.nvim",
		},
	})

	use({ -- git
		"TimUntersberger/neogit",
		requires = {
			"lewis6991/gitsigns.nvim",
			"sindrets/diffview.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- Fuzzy Finder (files, lsp, etc)
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"AckslD/nvim-neoclip.lua",
		},
	})

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
	})

	use({ "folke/which-key.nvim" })
	use({ "racso2609/keymaps-nvim" })

	use({ "morhetz/gruvbox" })
	use({ "xiyaowong/nvim-transparent" })
	use({ "kyazdani42/nvim-web-devicons" })

	-- cairo
	use({
		"ericglau/vim-cairo",
		requires = {
			"miguelmota/cairo.vim",
			"racso2609/cairo-support-nvim",
		},
	})
	-- js
	use({
		"styled-components/vim-styled-components",
		requires = {
			"mlaursen/vim-react-snippets",
			"mattn/emmet-vim",
		},
	})
	use("elkowar/yuck.vim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("ckipp01/stylua-nvim")

	-- auto close brackets etc
	use("jiangmiao/auto-pairs")
	use("windwp/nvim-ts-autotag")
	use("kyazdani42/nvim-tree.lua")
	use("folke/trouble.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	-- local has_plugins, plugins = pcall(require, 'custom.plugins')
	-- if has_plugins then
	--   plugins(use)
	-- end

	if is_bootstrap then
		require("packer").sync()
	end
end)
