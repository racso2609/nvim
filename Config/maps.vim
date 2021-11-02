"Auto close tags"
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
"inoremap < <><Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
"put ; at final"
nnoremap <C-M>; $a;<Esc>

nnoremap <C-M-f> :Rg<CR>

"fold
"inoremap <C-i> <C-O>za
"nnoremap <C-i> za
"onoremap <C-i> <C-C>za
"vnoremap <C-i> zf

"save and close

nnoremap <C-q> :q <CR>
nnoremap <C-M-Q> :q! <CR>
nnoremap <C-S> :w <CR>

" run current file
nnoremap <Leader>n :!node %<cr>

function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>


"move between split screen
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

"move top"
map <C-M-g> gg=G

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)


" Use alt + hjkl to resize windows
nnoremap <M-Down>  :resize -2<CR>
nnoremap <M-Up>  :resize +2<CR>
nnoremap <M-Left>  :vertical resize -2<CR>
nnoremap <M-Right>  :vertical resize +2<CR>
nnoremap <M-v> :vsplit <CR>
nnoremap <M-h> :split <CR>

" Move between buffers
"nnoremap <leader><tab> :bn<cr>
"nnoremap <leader><S-tab> :bp<cr>
"
" Closing and hiding current buffer
nnoremap <leader>w :bd<cr>

" NerdCommenter Toggle remap to CTRL+/
vmap <C-_> <Plug>NERDCommenterToggle<cr>
nmap <C-_> <Plug>NERDCommenterToggle<cr>

"NerdTree
nnoremap <C-b> :NERDTreeToggle<CR>

"EsLint
nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

"Prettier
nmap <C-p> <Plug>(Prettier)
"nmap <C-p> :Prettier<CR>
"FZF
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Buffers<CR>
nnoremap <C-h> :History<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)



" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
