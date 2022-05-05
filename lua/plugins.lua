local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

vim.cmd 'packadd paq-nvim'         -- Load package

require('paq'){

  {'savq/paq-nvim'};

  {'tpope/vim-sensible'};
 -- general
 {'voldikss/vim-floaterm'};
 {'terrortylor/nvim-comment'};
 {'jiangmiao/auto-pairs'};
 {'lukas-reineke/indent-blankline.nvim'}; -- show ident line

 {'neoclide/coc.nvim',branch= 'release'};
 {'rafcamlet/coc-nvim-lua'};
 -- color schemas
 {'folke/tokyonight.nvim'};
 {'tjdevries/colorbuddy.vim'};
 {'Th3Whit3Wolf/onebuddy'};
 {'xiyaowong/nvim-transparent'};
  -- todo comments --
  {'folke/todo-comments.nvim'};
  {'vimwiki/vimwiki'};
-- which key --
 {'folke/which-key.nvim'};
 -- dashboard --
 {'glepnir/dashboard-nvim'};
 -- telescope fuzzy finder --
 {'nvim-lua/plenary.nvim'};
 {'nvim-telescope/telescope.nvim'};
 {'elkowar/yuck.vim'};
 -- solidity
 {'tomlion/vim-solidity'};
  -- file management
  {'kyazdani42/nvim-tree.lua'};
 -- snippet
  {'SirVer/ultisnips'};
--treesitter
 {'nvim-treesitter/nvim-treesitter'};
 {'windwp/nvim-ts-autotag'};
 {'YongJieYongJie/tree-sitter-solidity'};
-- web development --
 {'mattn/emmet-vim'};
  -- {'windwp/nvim-ts-autotag'};
  -- js
 {'HerringtonDarkholme/yats.vim'} ;               -- 'ts syntax
 {'mxw/vim-jsx'};              --'jsx syntax}
 {'styled-components/vim-styled-components'};
 {'mlaursen/vim-react-snippets'};
 {'jelera/vim-javascript-syntax'};
 -- markdown
  {'thypon/vim-mymmd'};
 -- css
 -- use{'tree-sitter/tree-sitter-css'};
 --
 {'norcalli/nvim-colorizer.lua'};

}


require 'keymaps';
require 'syntax';
require('Tree')
require('nvim-ts-autotag').setup()
require'colorizer'.setup()
require('nvim_comment').setup()
require'colorizer'.setup()
require('todo-comments').setup();

require('which-key').setup();

require('transparent').setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    'BufferLineTabClose',
    'BufferlineBufferSelected',
    'BufferLineFill',
    'BufferLineBackground',
    'BufferLineSeparator',
    'BufferLineIndicatorSelected',
  },
  exclude = {}, -- table: groups you don't want to clear
})

