vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Configurations for Nvim LSP
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- formatter
  use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })
  use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim"s built-in LSP client

  --term
  -- use({ "voldikss/vim-floaterm" })

  -- file management
  use({ "samodostal/image.nvim" })

  -- js
  use({ "mxw/vim-jsx" }) --"jsx syntax}
  use({ "jelera/vim-javascript-syntax" })
  -- yuck
  -- cairo
  use({ "ericglau/vim-cairo" })
  use({ "miguelmota/cairo.vim" })
  -- use({ "racso2609/cairo-support-nvim"   })
  -- use({ "neoclide/coc.nvim", branch = "release" })
  -- md
  -- my Plugin
  -- use("MunifTanjim/eslint.nvim")
end)
