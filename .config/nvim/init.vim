" Last Modified: Sun, 19 Jun 2022 02:29:18 +0900

if !exists('g:vscode')
  source $HOME/.config/nvim/vim-plug/plugins.vim
endif

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

if !exists('g:vscode')
  " source $HOME/.config/nvim/general/paths.vim
  source $HOME/.config/nvim/themes/onedark.vim
  " source $HOME/.config/nvim/themes/onehalf.vim
  source $HOME/.config/nvim/themes/airline.vim
  source $HOME/.config/nvim/plug-config/asynctasks.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  " source $HOME/.config/nvim/plug-config/rainbow_parentheses.vim
  source $HOME/.config/nvim/plug-config/signify.vim
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/treesitter.vim
  source $HOME/.config/nvim/plug-config/notify.lua

  " luafile $HOME/.config/nvim/lua/plug-colorizer.lua
endif
