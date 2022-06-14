" Last Modified: Sun, 05 Jun 2022 01:31:54 +0900

" Transparency
let g:neovide_transparency=0.8
" Allow copy paste in neovim
let g:neovide_input_use_logo=v:false
map <D-v> "+p<CR>
map! <D-v> <C-R>+
tmap <D-v> <C-R>+
vmap <D-c> "+y<CR>
