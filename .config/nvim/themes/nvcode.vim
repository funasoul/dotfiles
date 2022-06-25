" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
" colorscheme nvcode " Or whatever colorscheme you make
colorscheme onedark " aurora dracula gruvbox lunar metanoia nord nvcode onedark palenight snazzy xoria

hi Normal guibg=NONE ctermbg=NONE

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
