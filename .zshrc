# User configuration
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

autoload -Uz compinit; compinit

# === Plugins ===
# === Zoxide ===
if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  # Optional: Fuzzy jump with fzf
  alias zi="zoxide query --interactive"
fi

# === FZF Config & Integration ===
zinit ice wait lucid atinit"source shell/key-bindings.zsh; source shell/completion.zsh"
zinit light junegunn/fzf

# import from oh-my-zsh
## fix loading omz-plugin issue.
## https://github.com/zdharma-continuum/zinit/discussions/651
_fix-omz-plugin() {
    [[ -f ./._zinit/teleid ]] || return 1
    local teleid="$(<./._zinit/teleid)"
    local pluginid
    for pluginid (${teleid#OMZ::plugins/} ${teleid#OMZP::}) {
        [[ $pluginid != $teleid ]] && break
    }
    (($?)) && return 1
    print "Fixing $teleid..."
    git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
    cd ./ohmyzsh
    git sparse-checkout set --no-cone /plugins/$pluginid
    git checkout --quiet
    cd ..
    local file
    for file (./ohmyzsh/plugins/$pluginid/*~(.gitignore|*.plugin.zsh)(D)) {
        print "Copying ${file:t}..."
        cp -R $file ./${file:t}
    }
    rm -rf ./ohmyzsh
}

# common zsh plugins
zinit wait lucid atpull"%atclone" atclone"_fix-omz-plugin" \
  for OMZ::plugins/{ant,docker,docker-compose,git-extras,gradle,mvn,npm,themes,web-search}

# OS specific plugins
if [[ "$OSTYPE" == "darwin"* ]]; then
  zinit wait lucid atpull"%atclone" atclone"_fix-omz-plugin" \
    for OMZ::plugins/{macos,macports}
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  zinit wait lucid atpull"%atclone" atclone"_fix-omz-plugin" \
    for OMZ::plugins/{ubuntu}
fi

# === Prompt ===
## Must Load OMZ Git library
zinit snippet OMZL::git.zsh
## Must Load OMZ Async prompt library
zinit snippet OMZL::async_prompt.zsh 
## Load Git plugin from OMZ
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided up to this moment
setopt promptsubst
## Set Prompt
PROMPT='$(show_virtual_env)%{$reset_color%}%n[%{$fg_bold[cyan]%}%m%{$reset_color%}$(git_prompt_info)]%{$reset_color%} '
RPROMPT="%B[%{${fg[green]}%} %~ %{${fg[default]}%}]%b"
SPROMPT="correct>%r (y/n/e/a)? "
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg[yellow]%}✗%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg_bold[yellow]%}✎%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_CLEAN=":%{$fg_bold[green]%}✓%{$reset_color%})"

# === my favorite plugins ===
# zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting.git
# zinit load 'zsh-users/zsh-history-substring-search'
# zinit ice wait atload'_history_substring_search_config'

# load after oh-my-zsh plugins
zinit wait'1' lucid light-mode for \
  wfxr/forgit

# lazy load
zinit wait lucid light-mode for \
  MichaelAquilina/zsh-you-should-use.git

# === source my .zshrc ===
source $HOME/.zshrc.funa

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/funa/.lmstudio/bin"
# End of LM Studio CLI section

# for install-release
fpath+=~/.zfunc; autoload -Uz compinit; compinit
