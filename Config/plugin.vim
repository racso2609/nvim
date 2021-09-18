" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

"syntax
Plug 'sheerun/vim-polyglot' "syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'
"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'codota/tabnine-vim'
"js completition
Plug 'pangloss/vim-javascript' "syntax
Plug 'mxw/vim-jsx' "jsx syntax
Plug 'Shougo/echodoc.vim'

"file finder
Plug 'junegunn/fzf.vim' "file finder fzf

"close html tags "
Plug 'alvan/vim-closetag'
"auto competation"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
" ES2015 code snippets (Optional)
"Plug 'epilande/vim-es2015-snippets'
" React code snippets
"Plug 'epilande/vim-react-snippets'

"pretier and eslint configuration
Plug 'dense-analysis/ale' "Eslint
Plug 'prettier/vim-prettier', {'do': 'yarn install','branch': 'release/0.x','for':['javascript','typescript','css','less','less','json', 'html','jsx']} "Format 

"make comments
Plug 'preservim/nerdcommenter'
"create auto tags emmet "
Plug 'mattn/emmet-vim'

Plug 'ryanoasis/vim-devicons'
"nerd Tree"
Plug 'preservim/nerdtree'
" Plug 'Shougo/vimfiler.vim'
"Plug 'gosukiwi/vim-atom-dark' 
" Plug 'folke/tokyonight.nvim'
"
"
" theme

"Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
call plug#end()

