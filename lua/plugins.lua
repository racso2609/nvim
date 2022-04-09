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




 -- file management
 {'kyazdani42/nvim-tree.lua'};
-- snippet
 {'SirVer/ultisnips'};

-- web development --
{'mattn/emmet-vim'};
 {'windwp/nvim-ts-autotag'};
 -- js
{'HerringtonDarkholme/yats.vim'} ;               -- "ts syntax
{'mxw/vim-jsx'};              --"jsx syntax}
{'styled-components/vim-styled-components'};
{'mlaursen/vim-react-snippets'};
-- css
-- use{'tree-sitter/tree-sitter-css'};
-- use{'norcalli/nvim-colorizer.lua'};
}

require("Tree")
require('nvim-ts-autotag').setup()
require('floatTerm')
require'colorizer'.setup()
require('nvim_comment').setup({line_mapping = "<c-_>", operator_mapping = "<leader>c"})
require('ultiSnipt')
require'colorizer'.setup()
