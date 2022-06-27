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
    Plug 'navarasu/onedark.nvim'
    " OneHalf theme
    " Plug 'sonph/onehalf', {'rtp': 'vim/'}    " vim is not maintained anymore
    " Fork of sonph/onehelf
    Plug 'BBaoVanC/onehalf', {'rtp': 'vim/'}
    " NVCode theme
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Airline
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    " A blazing fast and easy to configure Neovim statusline written in Lua.
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
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
    " Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more
    Plug 'tpope/vim-surround'
    " Display your undo history in a graph.
    Plug 'mbbill/undotree'
    " Vim Better Whitespace Plugin (:StripWhitespace)
    Plug 'ntpeters/vim-better-whitespace'
    " help Vim/Nvim users escape insert mode quickly using their customized key combinations, without experiencing the lag.
    Plug 'jdhao/better-escape.vim'
    " View and search LSP symbols, tags in Vim/NeoVim. (outline)
    Plug 'liuchengxu/vista.vim'
    " Seamlessly run Python code from Vim in IPython, including executing individual code cells similar to Jupyter notebooks and MATLAB.
    Plug 'jpalardy/vim-slime', { 'for': 'python' }
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    " for v0.7.0 or above
    if has("nvim-0.7.0")
      " Plug 'kyazdani42/nvim-web-devicons'   "we already have this by lualine"
      Plug 'romgrk/barbar.nvim'
    endif

call plug#end()
