#!/bin/zsh

usage() {
  echo "Usage: $0 hostname"
  echo "  Synchronize environment with specified host."
  echo "  Usually, this script will be exectured on new machine."
  echo "  (ex.) $0 funasoul"
  exit 1
}

is_dropbox_running() {
  # Return 0 if dropbox is running.
  # Thanks to Official Dropbox Command Line Interface.
  # https://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli
  if [[ -r ~/.dropbox/dropbox.pid ]]; then
    pid=$(cat ~/.dropbox/dropbox.pid)
  else
    return 1
  fi
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux
    if [[ -f /proc/${pid}/cmdline ]]; then
      grep -qi dropbox /proc/${pid}/cmdline
      return $?
    else
      return 1
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    ps -p $pid -o command | grep -qi dropbox.app
    return $?
  else
    # Unknown.
    return 1
  fi
}

if [ $# -lt 1 ] || [ ${HOST} = $1 ]; then
  usage
  return 1
fi
remotehost=$1

if [[ -f ~/.zshrc ]]; then
  echo "You already have ~/.zshrc. I will not initialize your environemnt."
  exit 0
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# do not use default ~/.zshrc
rm ~/.zshrc

# execute is_dropbox_running()
is_dropbox_running

if [ $? = 0 ]; then
  echo "Dropbox running"
else
  echo "Dropbox not running"
  echo "Rsync files from $remotehost..."
  mkdir -p ~/Dropbox/Sync
  rsync -auz ${remotehost}':Dropbox/Sync/.??*' ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/Emacs ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/mutt ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/nvim ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/ranger ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/wombat.style ~/Dropbox/Sync/
  rsync -auz ${remotehost}:Dropbox/Sync/zsh ~/Dropbox/Sync/
  if [[ "$OSTYPE" == "darwin"* ]]; then
    rsync -auz ${remotehost}:Dropbox/Sync/com.googlecode.iterm2.plist .
  fi
  echo "Removing unnecessary files."
  rm '$HOME/Dropbox/Sync/{.zshrc.local,.zsh3rc,.zshrc4.dist,.zshenv4.dist}'
fi

# Create symbolic link
cd
foreach i (.agignore .bash_profile .bashrc .exrc .gitconfig .gitignore_global .ideavimrc .inputrc .ispell_english .latexmkrc .muttrc .npmrc .pythonrc.py .screenrc .terminalizer .tmux .tmux.conf .vim .vimrc .vrapperrc .zlogin .zlogout .zshenv .zshrc)
  ln -s ~/Dropbox/Sync/$i .
end
ln -s ~/Dropbox/Sync/zsh/custom/zshrc-funa.zsh .zshrc.funa

mkdir -p ~/.config
cd ~/.config
ln -s ~/Dropbox/Sync/nvim .
ln -s ~/Dropbox/Sync/ranger .

echo "Syncenv done."
