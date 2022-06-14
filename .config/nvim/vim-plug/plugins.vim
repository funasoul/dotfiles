" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    " nvim-treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " OneDark theme
    " Plug 'joshdick/onedark.vim'
    Plug 'navarasu/onedark.nvim'
    " OneHalf theme
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Better Comments
    Plug 'tpope/vim-commentary'
    " FZF
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Adding color with colorizer & rainbow
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow Parentheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Which Key
    Plug 'liuchengxu/vim-which-key'
    " Floaterm
    Plug 'voldikss/vim-floaterm'
    " Project Management with Startify
    Plug 'mhinz/vim-startify'
    " Snippets with CoC
    Plug 'honza/vim-snippets'
    " Codi - An Interactive Scratchpad for Hackers
    Plug 'metakirby5/codi.vim'
    " fzf-preview is a (Neo)vim plugin and coc extensions written by TypeScript that provides powerfully integrates fzf.
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
    " Support for V in Vim
    Plug 'ollykel/v-vim'
    " The generic way to handle building/running/testing/deploying tasks by imitating vscode's task system.
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    " nvim-notify
    " :lua require("notify").notify("This is an error message", "error")
    Plug 'rcarriga/nvim-notify'

call plug#end()