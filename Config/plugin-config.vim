
"nvim config
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']
"Syntax typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


"------------------react Snippets--------------------------
"Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/Config/snippets/']
let g:UltiSnipsListSnippets="<C-l>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"------------------react Snippets--------------------------
"
"vimfiler
"nmap <silent><C-b>:VimFiler<Plug>(vimfiler)

"emmet-vim
let g:user_emmet_mode='a'  
let g:user_emmet_leader_key='<C-a>'
autocmd FileType html,css,js,jsx EmmetInstall

"EsLint

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" kite
let g:kite_supported_languages = ['*']
let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]

"Close tags"
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" coc
autocmd FileType scss setl iskeyword+=@-@
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"Use tab for trigger completion with characters ahead and navigate.
"NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


"prettier
au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
"let g:prettier#autoformat = 1
"let g:prettier#autoformat_require_pragma = 0
" show function firm
let g:echodoc_enable_at_startup = 1

let $FZF_DEFAULT_OPTS='--layout=reverse'

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)


