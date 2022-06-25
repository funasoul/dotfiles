syntax on
colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

hi Normal guibg=NONE ctermbg=NONE
" hi clear CursorLine
" hi CursorLine gui=underline cterm=underline

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
