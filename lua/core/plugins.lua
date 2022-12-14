vim.cmd([[packadd packer.nvim]])

local status, packer = pcall(require, "packer")
if (not status) then return end

local plugins = {
  -- mason
  -- lsp
  {
    name = "neovim/nvim-lspconfig",
    wants = {
      -- "nvim-lsp-installer",
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
    },
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      -- "williamboman/nvim-lsp-installer",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    }
  },

  { name = "wbthomason/packer.nvim" },
  -- utils
  { name = "jiangmiao/auto-pairs" },
  { name = "onsails/lspkind-nvim" }, -- cmp icons

  { name = "terrortylor/nvim-comment" },
  { name = "JoosepAlviste/nvim-ts-context-commentstring" },
  -- debug errors
  { name = "folke/trouble.nvim" },
  -- status line
  { name = "nvim-lualine/lualine.nvim" },
  -- cmp auto complete
  { name = "hrsh7th/nvim-cmp" },
  { name = "hrsh7th/cmp-nvim-lsp" },
  { name = "hrsh7th/cmp-buffer" },
  { name = "hrsh7th/cmp-path" },
  { name = "hrsh7th/cmp-cmdline" },
  { name = "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" },
  {
    name = "KadoBOT/cmp-plugins",
    config = function()
      require("cmp-plugins").setup({
        files = { ".*\\.lua" }, -- default
      })
    end,
  },
  { name = "hrsh7th/cmp-nvim-lsp-signature-help" },
  -- keymaps
  { name = 'racso2609/keymaps-nvim' },
  { name = "folke/which-key.nvim" },
  -- file tree
  { name = "kyazdani42/nvim-tree.lua" },
  -- snippets
  { name = "SirVer/ultisnips" },
  { name = "quangnguyen30192/cmp-nvim-ultisnips" },
  -- html and jsx
  { name = "mattn/emmet-vim" },
  { name = "windwp/nvim-ts-autotag" },
  -- syntax (treesitter)
  { name = "nvim-treesitter/nvim-treesitter" },
  { name = "YongJieYongJie/tree-sitter-solidity" },
  { name = "p00f/nvim-ts-rainbow" },
  -- file search (telescope)
  { name = "nvim-lua/plenary.nvim" },
  { name = "nvim-telescope/telescope.nvim" },
  { name = "nvim-telescope/telescope-media-files.nvim" },
  { name = "nvim-lua/popup.nvim" },
  { name = "ibhagwan/fzf-lua" },
  { name = "AckslD/nvim-neoclip.lua" },

  -- git
  { name = "TimUntersberger/neogit" },
  { name = "lewis6991/gitsigns.nvim" },
  { name = "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  { name = "folke/todo-comments.nvim" },
  { name = "renerocksai/telekasten.nvim" },
  -- cairo
  { name =  "~/Programming/nvim-plugins/cairo-support"  },

  { name= "ericglau/vim-cairo" },
  { name= "miguelmota/cairo.vim" },

  {name= "morhetz/gruvbox" }
}

packer.startup(function(use)
  for _, value in ipairs(plugins) do
    use({ value.name, wants = value.wants, run = value.run, requires = value.requires, config = value.config })
  end
end)
