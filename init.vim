lua require 'init'
let g:ale_linters = {
\   'proto': ['protolint'],
\}

let g:ale_fixers = {
\   'proto': ['ale#fixers#protolint#Fix'],
\}

" We recommend you set this.
let g:ale_lint_on_text_changed = 'never'
" autocmd BufWritePre *.py execute ':Black'
