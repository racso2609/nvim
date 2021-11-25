--plugin directory
-- call plug#begin('~/.local/share/nvim/plugged')
--   Plug 'sheerun/vim-polyglot' " generic syntax
--   Plug 


--   "-----telescope
--   Plug 'nvim-lua/plenary.nvim'
--   Plug 'nvim-telescope/telescope.nvim'


--   "---- auto pairs
--   Plug 



-- call plug#end()
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'folke/tokyonight.nvim'}
-- paq {'prettier/vim-prettier'}
-- paq 'mhartington/formatter.nvim'
paq 'sbdchd/neoformat'

paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', run = './install --bin'}
paq {'junegunn/fzf.vim'}
paq {'ibhagwan/fzf-lua'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'ojroques/nvim-lspfuzzy'}
paq 'mattn/emmet-vim'
paq 'terrortylor/nvim-comment'
paq 'kyazdani42/nvim-tree.lua'
paq 'jiangmiao/auto-pairs'

paq 'SirVer/ultisnips'
paq 'honza/vim-snippets'


------ ident guide
paq {'lukas-reineke/indent-blankline.nvim'}

--   ----- css
paq  'ap/vim-css-color'
paq  'hail2u/vim-css3-syntax'

------ ts and js --------
paq {'HerringtonDarkholme/yats.vim'}                -- "ts syntax
paq {'mxw/vim-jsx'}                                 --"jsx syntax}
paq {'styled-components/vim-styled-components'}
paq {'mlaursen/vim-react-snippets'}

g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
