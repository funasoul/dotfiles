syntax on
colorscheme onehalfdark

" hi clear CursorLine
" hi CursorLine gui=underline cterm=underline

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif
