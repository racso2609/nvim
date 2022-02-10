local cmd = vim.cmd
local g = vim.g
local fn = vim.fn


cmd 'packadd paq-nvim'               -- load the package manager

require('paq') -- a convenient alias
{
-- color schemas
--  {'folke/tokyonight.nvim'}
--  {'tjdevries/colorbuddy.vim'}
--  {"Th3Whit3Wolf/onebuddy"}
 'Matsuuu/pinkmare';
'tomlion/vim-solidity';

 -- 'sbdchd/neoformat';

 {'savq/paq-nvim', opt = true};    -- paq-nvim manages itself
 {'shougo/deoplete-lsp'};
 {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']};
 -- {'tbodt/deoplete-tabnine', run = './install.sh' };
--  {'neoclide/coc.nvim', run = fn['yarn install --frozen-lockfile']}
  {'prettier/vim-prettier',run = fn['yarn install && yarn add prettier-plugin-solidity']};


-- tree sitter and plugins
 {'nvim-treesitter/nvim-treesitter'};
 'nvim-treesitter/playground';
 'romgrk/nvim-treesitter-context';
 'windwp/nvim-ts-autotag';
 'voldikss/vim-floaterm';
 'mattn/emmet-vim';
 'terrortylor/nvim-comment';
 'kyazdani42/nvim-tree.lua';
 'jiangmiao/auto-pairs';
 'glepnir/lspsaga.nvim';
 'vimwiki/vimwiki';


 {'neovim/nvim-lspconfig'};
 {'junegunn/fzf', run = './install --bin'};
 {'junegunn/fzf.vim'};
 {'ibhagwan/fzf-lua'};
 {'kyazdani42/nvim-web-devicons'};
 {'ojroques/nvim-lspfuzzy'};

 'SirVer/ultisnips';
 'honza/vim-snippets';


------ ident guide
 {'lukas-reineke/indent-blankline.nvim'};

--   ----- css
 'tree-sitter/tree-sitter-css';
 'norcalli/nvim-colorizer.lua';

------ ts and js --------
 {'HerringtonDarkholme/yats.vim'} ;               -- "ts syntax
 {'mxw/vim-jsx'};              --"jsx syntax}
 {'styled-components/vim-styled-components'};
 {'mlaursen/vim-react-snippets'};



}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
