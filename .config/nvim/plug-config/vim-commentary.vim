function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else    
    execute "'<,'>Commentary"
  endif
endfunction
" vnoremap <silent> <space>/ :call Comment()

" nnoremap <space>/ :Commentary<CR>
" vnoremap <space>/ :Commentary<CR>
