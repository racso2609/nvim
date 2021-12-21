local cmd = vim.cmd
local g = vim.g
local fn = vim.fn


cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
-- color schemas
-- paq {'folke/tokyonight.nvim'}
-- paq {'tjdevries/colorbuddy.vim'}
-- paq {"Th3Whit3Wolf/onebuddy"}
paq 'Matsuuu/pinkmare'

paq 'sbdchd/neoformat'

paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'tbodt/deoplete-tabnine', run = './install.sh' }
-- paq {'neoclide/coc.nvim', run = fn['yarn install --frozen-lockfile']}

-- tree sitter and plugins
paq {'nvim-treesitter/nvim-treesitter'}
paq 'romgrk/nvim-treesitter-context'
paq 'windwp/nvim-ts-autotag'
paq 'voldikss/vim-floaterm'
paq 'mattn/emmet-vim'
paq 'terrortylor/nvim-comment'
paq 'kyazdani42/nvim-tree.lua'
paq 'jiangmiao/auto-pairs'
paq 'glepnir/lspsaga.nvim'
paq 'vimwiki/vimwiki'


paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', run = './install --bin'}
paq {'junegunn/fzf.vim'}
paq {'ibhagwan/fzf-lua'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'ojroques/nvim-lspfuzzy'}

paq 'SirVer/ultisnips'
paq 'honza/vim-snippets'


------ ident guide
paq {'lukas-reineke/indent-blankline.nvim'}

--   ----- css
paq 'tree-sitter/tree-sitter-css'
paq 'norcalli/nvim-colorizer.lua'

------ ts and js --------
paq {'HerringtonDarkholme/yats.vim'}                -- "ts syntax
paq {'mxw/vim-jsx'}                                 --"jsx syntax}
paq {'styled-components/vim-styled-components'}
paq {'mlaursen/vim-react-snippets'}

g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
