--/* cSpell:disable */
-- local cmd = vim.cmd
-- local g = vim.g
  -- local fn = vim.fn

vim.cmd 'packadd paq-nvim'         -- Load package

require('paq'){
  {'savq/paq-nvim'};
  -- {'tpope/vim-sensible'};
  -- documentation
  -- {'stsewd/sphinx.nvim'};

 -- general
  {'voldikss/vim-floaterm'};
  {'terrortylor/nvim-comment'};
  {'jiangmiao/auto-pairs'};
  {'lukas-reineke/indent-blankline.nvim'}; -- show ident line
  -- {'kyazdani42/nvim-web-devicons'};
  {'yamatsum/nvim-nonicons'};
  {'norcalli/nvim-colorizer.lua'};

 -- airline
  {"nvim-lualine/lualine.nvim"};

-- auto complete
  {'neoclide/coc.nvim',branch= 'release'};
  {'hrsh7th/nvim-compe'};
  {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'};

 -- color schemas
  {'folke/tokyonight.nvim'};
  {'tjdevries/colorbuddy.vim'};
  {'morhetz/gruvbox'};
  {'Th3Whit3Wolf/onebuddy'};
  {'xiyaowong/nvim-transparent'};

  -- todo--
  {'folke/todo-comments.nvim'};
  {'renerocksai/telekasten.nvim'};
  -- {'vimwiki/vimwiki'};

-- which key --
  {'folke/which-key.nvim'};

 -- dashboard --
  {'glepnir/dashboard-nvim'};

 -- telescope fuzzy finder --
  {'nvim-lua/plenary.nvim'};
  {'nvim-telescope/telescope.nvim'};
  {'nvim-telescope/telescope-media-files.nvim'};
  {'nvim-lua/popup.nvim'};
  {'ibhagwan/fzf-lua'};

 -- eww support
  {'elkowar/yuck.vim'};

 -- solidity
  {'tomlion/vim-solidity'};

  -- file management
  {'kyazdani42/nvim-tree.lua'};

 -- snippet
  {'SirVer/ultisnips'};

--treesitter
  {'nvim-treesitter/nvim-treesitter'};
  {'YongJieYongJie/tree-sitter-solidity'};

-- web development --
  {'mattn/emmet-vim'};
  {'windwp/nvim-ts-autotag'};

  -- js
  {'HerringtonDarkholme/yats.vim'} ;               -- 'ts syntax
  {'mxw/vim-jsx'};              --'jsx syntax}
  {'styled-components/vim-styled-components'};
  {'mlaursen/vim-react-snippets'};
  {'jelera/vim-javascript-syntax'};

 -- markdown
  {"preservim/vim-markdown"};
  -- {'ellisonleao/glow.nvim'};
  {'jghauser/follow-md-links.nvim'};

 -- css
  {'tree-sitter/tree-sitter-css'};

-- git
  {'TimUntersberger/neogit'};
  {'tanvirtin/vgit.nvim'};
-- clipboard
  {'AckslD/nvim-neoclip.lua'};
  {'nvim-lua/plenary.nvim'};
}


require'colorizer'.setup()

-- require('glow').setup({
  -- style = "dark",
  -- width = 120,
-- })


