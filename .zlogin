#
#	~/.zlogin
#
echo -n '        .zlogin' 1>&2

#
# setup for modem
#
if [ x$TERM = xdialup ]; then
	export TERM=vt100
	export LESSCHARSET=japanese-sjis
	/bin/stty pass8
	/bin/stty rows 23
	/bin/stty columns 80
	alias rmail='mule -nw -e mh-rmail'
	tele=y
else
	tele=n
fi

[[ -n "$TMUX" ]] && stty erase 
[[ "$TERM" =~ ^screen ]] && stty erase 

if [ $OSTYPE = "linux-gnu" ]; then
  export TERM=screen-256color
fi

echo -n . 1>&2
#
# set display
#
#export CONSOLE=`~funa/bin/shell/ff -c | awk '/^funa/{print $3}'`
export CONSOLE=$HOST
export TITLE=$CONSOLE

#if [ x$DISPLAY = xunix:0.0 ]; then
#else
#	export DISPLAY=$CONSOLE:0
#fi

echo . 1>&2
#
# pyenv
# It is almost certainly better to add it to your profile / login shell only, and not your rc.
# Turn USE_PYENV ON if you want to use it.
USE_PYENV="OFF"
#USE_PYENV="ON"
if [ $USE_PYENV = "ON" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if _has pyenv; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    # eval "$(pyenv init - zsh --no-rehash)"
    # eval "$(pyenv virtualenv-init -)"
    source $PYENV_ROOT/completions/pyenv.zsh
  fi
fi

#
# start up
#
#if [ x$TTY = x/dev/ttyv0 -a $HOST != cosmos ]; then
if [ x$TTY = x/dev/ttyv0 -o x$TTY = x/dev/tty1 -o x$TTY = x/dev/ttyE0 -o x$TTY = x/dev/console ]; then
	echo -n 'X-Window(Fvwm2/KDE3/No)?'
	read tmp
	case $tmp {
	  f)
		ln -sf $HOME/.xinitrc.fvwm2 .xinitrc
		ssh-agent xinit >&! $HOME/.xinitrc.err
		;;
	  k)
		ln -sf $HOME/.xinitrc.kde .xinitrc
		ssh-agent xinit >&! $HOME/.xinitrc.err
		;;
	  n)
		ln -sf $HOME/.xinitrc.fvwm2 .xinitrc
		return
		;;
	  *)
		ln -sf $HOME/.xinitrc.fvwm2 .xinitrc
		ssh-agent xinit >&! $HOME/.xinitrc.err
#		ssh-agent sh -c "ssh-add && exec xinit"
	}	
	px|sed '/ps /d'
	echo -n 'Logout ?'
	read hogehoge
	case $hogehoge {
		n)
		  return 
		  ;;
		*)
		  /bin/rm -rf ~/.trashcan/*(N) > /dev/null
		  /bin/rm -rf ~/.trashcan/.??*(N) > /dev/null
		  logout
	}
fi
