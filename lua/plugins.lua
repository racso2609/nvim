local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

-- cmd [[packadd packer.nvim]]

cmd 'packadd paq-nvim'               -- load the package manager
require 'keymaps'

require('paq'){

 -- general
{'voldikss/vim-floaterm'};
{'terrortylor/nvim-comment'};
{'jiangmiao/auto-pairs'};
{'lukas-reineke/indent-blankline.nvim'}; -- show ident line
{'neoclide/coc.nvim', run=fn['yarn install --frozen-lockfile']};
{'rafcamlet/coc-nvim-lua'};
-- color schemas
{'folke/tokyonight.nvim'};
{'tjdevries/colorbuddy.vim'};
{"Th3Whit3Wolf/onebuddy"};

-- which key --
{"folke/which-key.nvim"};

-- dashboard --
{"glepnir/dashboard-nvim"};
-- telescope fuzzy finder --
{'nvim-lua/plenary.nvim'};
{'nvim-telescope/telescope.nvim'};




 -- file management
 {'kyazdani42/nvim-tree.lua'};
-- snippet
 {'SirVer/ultisnips'};

-- web development --
{'mattn/emmet-vim'};
 -- {'windwp/nvim-ts-autotag'};
 -- js
{'HerringtonDarkholme/yats.vim'} ;               -- "ts syntax
{'mxw/vim-jsx'};              --"jsx syntax}
{'styled-components/vim-styled-components'};
{'mlaursen/vim-react-snippets'};
-- css
-- use{'tree-sitter/tree-sitter-css'};
--
{'norcalli/nvim-colorizer.lua'};
}

require("Tree")
-- require('nvim-ts-autotag').setup()
require'colorizer'.setup()
require('nvim_comment').setup({line_mapping = "<C-_>", operator_mapping = "<leader>c"})
require'colorizer'.setup()

require("which-key").setup();
