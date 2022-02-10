" Prettier for Lua
" function PrettierLuaCursor()
  " let save_pos = getpos(".")
  " %! prettier --stdin --parser="lua"
  " call setpos('.', save_pos)
" endfunction
" define custom command
" command PrettierLua call PrettierLuaCursor()
" format on save
" autocmd BufwritePre *.lua PrettierLua
let g:prettier#autoformat = 1
autocmd BufWritePre *.sol Prettier
