local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

vim.cmd 'packadd paq-nvim'         -- Load package

require('paq'){
  {'savq/paq-nvim'};
  -- {'tpope/vim-sensible'};

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
  {'ellisonleao/glow.nvim'};
  {'jghauser/follow-md-links.nvim'};

 -- css
  {'tree-sitter/tree-sitter-css'};

-- git
  {'TimUntersberger/neogit'};
  {'tanvirtin/vgit.nvim'};
-- clipboard
  {'AckslD/nvim-neoclip.lua'};
}


-- require 'keymaps';
require('nvim-ts-autotag').setup()
require'colorizer'.setup()
require('nvim_comment').setup()
require'colorizer'.setup()
require('todo-comments').setup();
require'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
require('telescope').load_extension('media_files')
require('telescope').load_extension('neoclip')

require('which-key').setup();
require('vgit').setup()
require('neoclip').setup()

-- require('glow').setup({
  -- style = "dark",
  -- width = 120,
-- })

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

