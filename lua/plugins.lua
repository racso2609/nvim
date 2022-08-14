vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use {"williamboman/nvim-lsp-installer"}

  -- keymap
  use {"folke/which-key.nvim"}

  --term
  use {'voldikss/vim-floaterm'}

  -- file management
  use {'kyazdani42/nvim-tree.lua'}

  -- comment utilities
  use {'terrortylor/nvim-comment'}

  -- snippet
  use {'SirVer/ultisnips'}



  -- web development --
  use {'mattn/emmet-vim'}
  use {'windwp/nvim-ts-autotag'}


  --treesitter
  use {'nvim-treesitter/nvim-treesitter'}
  use {'YongJieYongJie/tree-sitter-solidity'}

 -- telescope fuzzy finder --
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-media-files.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'ibhagwan/fzf-lua'}
  use {'AckslD/nvim-neoclip.lua'}

  -- git
  use {'TimUntersberger/neogit'}
  use {'tanvirtin/vgit.nvim'}

end)
