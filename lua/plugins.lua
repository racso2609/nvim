vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Configurations for Nvim LSP
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer" })
	use({ "jiangmiao/auto-pairs" })
	-- use({ 'lukas-reineke/lsp-format.nvim' })
	use({ "folke/trouble.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- airline
	use({ "nvim-lualine/lualine.nvim" })

	-- autocomplete
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({
		"KadoBOT/cmp-plugins",
		config = function()
			require("cmp-plugins").setup({
				files = { ".*\\.lua" }, -- default
			})
		end,
	})
	use("onsails/lspkind-nvim")
	-- formatter
	use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim"s built-in LSP client

	-- keymap
	use({ "folke/which-key.nvim" })

	--term
	-- use({ "voldikss/vim-floaterm" })

	-- file management
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "samodostal/image.nvim" })

	-- comment utilities
	use({ "terrortylor/nvim-comment" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- snippet
	use({ "SirVer/ultisnips" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips" })

	-- web development --
	use({ "mattn/emmet-vim" })
	use({ "windwp/nvim-ts-autotag" })

	--treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "YongJieYongJie/tree-sitter-solidity" })
	use({ "p00f/nvim-ts-rainbow" })

	-- telescope fuzzy finder --
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "ibhagwan/fzf-lua" })
	use({ "AckslD/nvim-neoclip.lua" })

	-- git
	use({ "TimUntersberger/neogit" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- todo--
	use({ "folke/todo-comments.nvim" })
	use({ "renerocksai/telekasten.nvim" })

	-- theme and color schema
	use({ "morhetz/gruvbox" })
	use({ "xiyaowong/nvim-transparent" })
	use({ "lukas-reineke/indent-blankline.nvim" }) -- show ident line
	use({ "Th3Whit3Wolf/onebuddy" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use({ "tjdevries/colorbuddy.vim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use("Mofiqul/vscode.nvim")

	-- js
	use({ "mxw/vim-jsx" }) --"jsx syntax}
	use({ "styled-components/vim-styled-components" })
	use({ "mlaursen/vim-react-snippets" })
	use({ "jelera/vim-javascript-syntax" })
	-- yuck
	use({ "elkowar/yuck.vim" })
	-- cairo
	use({ "ericglau/vim-cairo" })
	use({ "miguelmota/cairo.vim" })
	-- use({ "racso2609/cairo-support-nvim"   })
	use({ "~/Programming/nvim-plugins/cairo-support" })
	-- use({ "neoclide/coc.nvim", branch = "release" })
	-- md
	use({ "ellisonleao/glow.nvim" })
	-- my Plugin
	use("racso2609/keymaps-nvim")
  use("MunifTanjim/eslint.nvim")
end)
