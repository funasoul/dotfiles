#
#	~/.zshenv
#
#echo -n reading .zshenv

## Internal utility functions
# Returns whether the given command is executable or aliased.
_has() {
	return $( whence $1 &>/dev/null )
}

### HOST TYPE ###
#case $HOSTTYPE in
case $OSTYPE in
  freebsd*)
	export HOST_TYPE=freebsd
	;;
  darwin8.*)
	export HOST_TYPE=MacOSX_Tiger
	;;
  darwin9.*)
	export HOST_TYPE=MacOSX_Leopard
	;;
  darwin10.*)
	export HOST_TYPE=MacOSX_SnowLeopard
	;;
  darwin11.*)
	export HOST_TYPE=MacOSX_Lion
	;;
  darwin12.*)
	export HOST_TYPE=MacOSX_MountainLion
	;;
  darwin13.*)
	export HOST_TYPE=MacOSX_Marvericks
	;;
  darwin14.*)
	export HOST_TYPE=MacOSX_Yosemite
	;;
  darwin15.*)
	export HOST_TYPE=MacOSX_ElCapitan
	;;
  darwin16.*)
	export HOST_TYPE=MacOS_Sierra
	;;
  darwin17.*)
	export HOST_TYPE=MacOS_HighSierra
	;;
  darwin18.*)
	export HOST_TYPE=MacOS_Mojave
	;;
  darwin19.*)
	export HOST_TYPE=MacOS_Catalina
	;;
  darwin20.*)
	export HOST_TYPE=MacOS_BigSur
	;;
  darwin21.*)
	export HOST_TYPE=MacOS_Monterey
	;;
  netbsd*)
	export HOST_TYPE=netbsd
	;;
  openbsd*)
	export HOST_TYPE=openbsd
  ;;
  linux*)
    if [[ $(uname -r) == *"microsoft-standard"* ]]; then
      export HOST_TYPE=WSL
    else
      export HOST_TYPE=linux
			if _has lsb_release; then
				export DISTRO=$(lsb_release -si)
			fi
    fi
	;;
  *)
	export HOST_TYPE=$OSTYPE
	;;
esac

### environment variables ###
export	HOST=`hostname -s`
export	USER=funa
export	HOSTTYPE
export	NAME="Akira Funahashi"
#export	ORGANIZATION="ERATO Kitano Symbiotic Systems Project, JST"
export	ORGANIZATION="Dept. of Biosciences and Informatics, Keio University"
export  PRINTER=FX_DocuPrint_P300_d
export	PGPPATH=$HOME/.pgp
export	JSERVER=localhost
export	CSERVER=localhost
export	CANNAHOST=localhost
export	CANNAFILE=$HOME/.canna
export	CVS_RSH=ssh
export	CVSEDITOR=vim
#export	CVSEDITOR=emacsclient
#export	XENVIRONMENT=$HOME/.Xdefaults
export	XAPPLRESDIR=$HOME/lib/app-defaults
export	ONEW_ENGINE=canna
export	TRRDIR=/export/home/trr
#export	XMODIFIERS="@im=_XWNMO"
#export	XMODIFIERS="@im=kinput2"
#export	ANT_HOME=/usr/local/ant
export  GNUTERM=aqua
#export  PKG_CONFIG_PATH=/usr/local/opencv/lib/pkgconfig
export  LC_CTYPE="ja_JP.UTF-8"

### path ###
# common path
_path=( \
#/Developer/NVIDIA/CUDA-5.0/bin \
$HOME/.local/bin \
$HOME/.local/nvim/bin \
$HOME/go/bin \
/usr/local/cuda/bin \
/usr/local/w3m/bin \
/usr/local/bin \
/usr/local/sbin \
/opt/local/bin \
/opt/local/sbin \
/usr/X11R6/bin \
/usr/local/anaconda3/bin \
/Applications/MacPorts/Emacs.app/Contents/MacOS \
/Applications/MacPorts/Emacs.app/Contents/MacOS/bin \
/Applications/MacPorts/kitty.app/Contents/MacOS \
/Applications/Emacs.app/Contents/MacOS \
/Applications/Emacs.app/Contents/MacOS/bin \
/Applications/Onivim2.app/Contents/MacOS \
#/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin \   # includes space in the path may not work with launchagent
/bin /usr/bin /sbin /usr/sbin \
/usr/local/infer-osx-v0.17.0/bin \
/usr/local/arm-apple-darwin/bin \
/usr/share/tmux-plugin-manager/ \
)

# for my path
#path=($HOME/.vim/bin $HOME/bin{/shell,} $HOME/SBW/bin /Applications/Emacs.app/Contents/MacOS/bin /Applications/Gnuplot.app/Contents/Resources/bin $_path)
path=($HOME/bin{/shell,} $HOME/.local/nvim/bin $HOME/Dropbox/Sync/bin{/shell,} $HOME/.cargo/bin $HOME/.nimble/bin $HOME/SBW/bin $HOME/android-sdks/platform-tools/ $_path)
unset _path
# add path for npm global installed module
if [ -d ${HOME}/.local/lib/npm/bin ]; then
  export PATH=${PATH}:${HOME}/.local/lib/npm/bin
fi

# cargo (rust) setup
if [ -d ${HOME}/.cargo/env ]; then
  source "$HOME/.cargo/env"
fi

### SBW stuff ###
#export SBW_HOME="/Applications/SBW-2.5.5/SBWLauncher.app/Contents/Resources/Java/"
#export PATH="$PATH:$SBW_HOME/bin"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$SBW_HOME/lib"
#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$SBW_HOME/lib"
export SBW_HOME=/Applications/SBW-2.7.8
#export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:/Applications/SBW-2.7.8/SBWLauncher.app/Contents/Resources/Java/lib/:$DYLD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/usr/local/cuda/lib
export PATH=$PATH:/Applications/SBW-2.7.8/SBWLauncher.app/Contents/Resources/Java/bin/
export MONO_MWF_MAC_FORCE_X11=1

### etc. ###
umask 022
limit coredumpsize 0
#echo .
