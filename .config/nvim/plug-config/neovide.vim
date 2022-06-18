" Last Modified: Sun, 19 Jun 2022 02:32:32 +0900

" Transparency
let g:neovide_transparency=0.8

" Allow copy paste in neovim
" https://github.com/neovide/neovide/discussions/1220#discussioncomment-2708561
" Use command key
let g:neovide_input_use_logo=v:true
" copy
vnoremap <D-c> "+y

" paste
nnoremap <D-v> "+p
inoremap <D-v> <Esc>"+pa
cnoremap <D-v> <c-r>+
tnoremap <D-v> <C-\><C-n>"+pi<right>

" undo
nnoremap <D-z> u
inoremap <D-z> <Esc>ua
