" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
"set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
"set clipboard+=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

" funa setting
"set mouse=                              "disable mouse function on vim
set backspace=start,eol,indent
set hlsearch
set ignorecase
set smartcase
set infercase           " 補完時に大文字小文字を区別しない
set noincsearch    "インクリメンタルサーチを無効
set nowrapscan
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set showmatch
set viminfo+=:10000                     " Save history 10,000 lines
" no backup for file in /tmp (for crontab -e)
set backupskip=/tmp/*,/private/tmp/*
" Never set to double!!!
" set ambiwidth=double

" Check OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if g:os == "Darwin"
"  let g:python_host_prog='/opt/local/bin/python2'
  let g:python3_host_prog='/opt/local/bin/python'
endif

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

"" Insert timestamp after 'Last modified: '
" If buffer modified, update any 'Last modified: ' in the first 40 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([40, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last [Mm]odified: \).*#\1' .
          \ strftime('%a, %d %b %Y %H:%M:%S %z') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

" You can't stop me
cmap w!! w !sudo tee %
