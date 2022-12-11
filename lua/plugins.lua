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
  use()
  -- use({ "neoclide/coc.nvim", branch = "release" })
  -- md
  use({ "ellisonleao/glow.nvim" })
  -- my Plugin
  use("MunifTanjim/eslint.nvim")
end)
