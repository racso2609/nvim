" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

"syntax
"------------ syntax typescript--------------------
Plug 'HerringtonDarkholme/yats.vim'
"----------js and jsx syntax-----------"
Plug 'pangloss/vim-javascript' "syntax
Plug 'mxw/vim-jsx' "jsx syntax

"---------- css syntax----------
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color' " preview of colors css

"------------ Generic syntax--------------------
Plug 'sheerun/vim-polyglot' "syntax
"---------------styled component syntax------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"--------- Color theme --------------------------
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rakr/vim-one'
"Plug 'gosukiwi/vim-atom-dark' 
" Plug 'folke/tokyonight.nvim'
"Plug 'drewtempelmeyer/palenight.vim'


"---------------------status bar--------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" --------------- auto completition---------------------
"Plug 'codota/tabnine-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "----------------js completition
Plug 'Shougo/echodoc.vim'

"---------------file finder-------------
Plug 'junegunn/fzf.vim' "file finder fzf
Plug 'junegunn/fzf' "file finder fzf

"----------------close html tags------------------ 
Plug 'alvan/vim-closetag'

"snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'


"----------------------pretier and eslint configuration--------------
Plug 'dense-analysis/ale' "Eslint
Plug 'prettier/vim-prettier', {'do': 'yarn install','for':['javascript','typescript','css','less','less','json', 'html','jsx','tsx']} "Format 

"-----------------make comments------------
Plug 'preservim/nerdcommenter'
"-------------create auto tags emmet -----------------
Plug 'mattn/emmet-vim'
"------- dev icons----------------
Plug 'ryanoasis/vim-devicons'
"----------nerd Tree-----------
Plug 'preservim/nerdtree'
"Plug 'preservim/nerdtree' |
            "\ Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'scrooloose/nerdtree-project-plugin'

" Plug 'Shougo/vimfiler.vim'
"-------extra utilities------
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'editorconfig/editorconfig-vim'

"
"
call plug#end()

