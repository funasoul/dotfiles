" from my .exrc and .vimrc
nnoremap Q :qall<CR>
nnoremap <C-u> :nohlsearch<CR>
nnoremap P "zp
nnoremap -1 "1p
nnoremap -2 "2p
nnoremap -3 "3p
nnoremap -4 "4p
nnoremap -0 myG"zy'y'y
nnoremap -- mz"zy'k'z
nnoremap -= mz"zd'k'z
nnoremap -y "zy'k

" disable recording to macro
nnoremap q <Nop>

" history-search-backward like zsh
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Emacs binding in command mode.
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <A-j>    :resize -2<CR>
nnoremap <A-k>    :resize +2<CR>
nnoremap <A-h>    :vertical resize -2<CR>
nnoremap <A-l>    :vertical resize +2<CR>

" I hate escape more than anything else
"inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
" nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Jump to next/prev hunk by gitgutter
nmap <C-j> <Plug>(signify-next-hunk)
nmap <C-k> <Plug>(signify-prev-hunk)

" nnoremap <Leader>o o<Esc>^Da
" nnoremap <Leader>O O<Esc>^Da

" Vim: search and highlight but do not jump
" I do not want Vim to jump to the next match when * is pressed, it should remain on the current word.
" https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap * :keepjumps normal! mi*`i<CR>

" AsyncTask and AsycnRun
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

nnoremap <silent>;   :Commands<CR>
