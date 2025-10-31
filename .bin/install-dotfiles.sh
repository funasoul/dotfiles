#!/usr/bin/env zsh

# Original script: https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh

DOTFILES_REPO=git@github.com:funasoul/dotfiles.git
DOTFILES_DIR=$HOME/.dotfiles
DOTFILES_BACKUP=$HOME/.dotfiles-backup

red=`tput setaf 1; tput bold`
green=`tput setaf 2; tput bold`
cyan=`tput setaf 6; tput bold`
reset=`tput sgr0`

# Here we go.
pushd $HOME

# verify github SSH key
ssh -T git@github.com
if [ $? != "1"  ]; then
  echo "[${red}x${reset}] Please add your SSH key to github."
  popd
  return 1
fi

# (re)install oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
  echo "Removing $HOME/.oh-my-zsh ..."
  command rm -rf $HOME/.oh-my-zsh
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

# git clone bare repository
git clone --bare $DOTFILES_REPO $DOTFILES_DIR
function config {
   command git --git-dir=$DOTFILES_DIR --work-tree=$HOME $@
}

# git checkout
config checkout
if [ $? = 0 ]; then
  echo "[${green}o${reset}] Checked out config."
  else
    mkdir -p $DOTFILES_BACKUP
    echo "[${red}x${reset}] Backing up pre-existing dot files to ${cyan}$DOTFILES_BACKUP ${reset}."
    # dirty hack.
    mkdir -p $DOTFILES_BACKUP/.bin
    mkdir -p $DOTFILES_BACKUP/.config/bat
    mkdir -p $DOTFILES_BACKUP/.config/bspwm
    mkdir -p $DOTFILES_BACKUP/.config/ctpv
    mkdir -p $DOTFILES_BACKUP/.config/eza
    mkdir -p $DOTFILES_BACKUP/.config/fastfetch
    mkdir -p $DOTFILES_BACKUP/.config/i3
    mkdir -p $DOTFILES_BACKUP/.config/kitty/kitty_grab
    mkdir -p $DOTFILES_BACKUP/.config/kitty/themes
    mkdir -p $DOTFILES_BACKUP/.config/lazygit
    mkdir -p $DOTFILES_BACKUP/.config/lf
    mkdir -p $DOTFILES_BACKUP/.config/lvim/lua
    mkdir -p $DOTFILES_BACKUP/.config/mpv
    mkdir -p $DOTFILES_BACKUP/.config/neofetch
    mkdir -p $DOTFILES_BACKUP/.config/neomutt
    mkdir -p $DOTFILES_BACKUP/.config/nvim/general
    mkdir -p $DOTFILES_BACKUP/.config/nvim/keys
    mkdir -p $DOTFILES_BACKUP/.config/nvim/lua/config
    mkdir -p $DOTFILES_BACKUP/.config/nvim/lua/custom
    mkdir -p $DOTFILES_BACKUP/.config/nvim/lua/plugins
    mkdir -p $DOTFILES_BACKUP/.config/nvim/plug-config
    mkdir -p $DOTFILES_BACKUP/.config/nvim/themes
    mkdir -p $DOTFILES_BACKUP/.config/nvim/vim-plug
    mkdir -p $DOTFILES_BACKUP/.config/picom
    mkdir -p $DOTFILES_BACKUP/.config/pistol
    mkdir -p $DOTFILES_BACKUP/.config/polybar/scripts
    mkdir -p $DOTFILES_BACKUP/.config/rofi
    mkdir -p $DOTFILES_BACKUP/.config/sxhkd
    mkdir -p $DOTFILES_BACKUP/.config/yazi
    mkdir -p $DOTFILES_BACKUP/.hammerspoon
    mkdir -p $DOTFILES_BACKUP/.source-highlight
    mkdir -p $DOTFILES_BACKUP/.terminalizer
    config checkout 2>&1 | egrep "\s+\.|\s+README" | awk {'print $1'} | xargs -I{} mv {} $DOTFILES_BACKUP/{}
    config checkout
    if [ $? = 0 ]; then
      echo "[${green}o${reset}] Checked out config."
    else
      echo "[${red}x${reset}] Still have some errors. Please see the log above and fix it by hand."
    fi
fi

# git config
config config status.showUntrackedFiles no

popd
