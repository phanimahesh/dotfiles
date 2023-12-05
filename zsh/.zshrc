# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Show a summary if something takes more than these many seconds 
REPORTTIME=5

# Set emacs keybindings. I'm a vimmer but emacs kbs are convenient
# in shell.
bindkey -e

ZPLUG_LOADFILE=$HOME/.zsh-plugs
source $HOME/.zplug/init.zsh
# Prefer shallow clones for zplug managed repos.
zstyle ":zplug:tag" depth 10
# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  # This weird hack is to prevent a message when some plugins are skipped
  # due to if: conditions.
  zplug check --verbose
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Finally load plugins
zplug load

setopt interactivecomments


# set some history options
# Save history. zsh doesn't unless this is set
HISTFILE=$HOME/.zsh_history
# Larger history
HISTSIZE=500000;
SAVEHIST=$HISTSIZE;
# Make some commands not show up in history
HISTIGNORE=" *:ls:ls *:cd:cd -:pwd:exit:date:* --help:* -h:man *:hledger *:ledger *";
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
# Share your history across all your terminal windows
setopt share_history

export LSCOLORS=Gxfxcxdxbxegedabagacad
command -v dircolors >/dev/null 2>&1 && eval "$(dircolors -b)"

# compinit slows down startup significantly. dunno why.
# autoload -Uz compinit && compinit

zstyle ":completion:*" auto-description "specify: %d"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" verbose true

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"

setopt menu_complete   # autoselect the first completion entry
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

zmodload -i zsh/complist
zstyle ':completion:*:*:*:*:*' menu select

# colorize ls tab-completion menu
zstyle ':completion:*' list-colors ''

# Allow ctrl-o to accept a dir and show completion menu for
# entries in that dir.
bindkey -M menuselect '^o' accept-and-infer-next-history
# Cache completions
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show


setopt auto_pushd
setopt pushd_ignore_dups

# Disable Ctrl-S and Ctrl-Q for starting/stopping terminal output.
# This frees up Ctrl-Q for push-line, which clears current half-typed command
# and returns it as soon as next command is done. Excellent when I forget to
# do something but have already half-typed the next command that depends on it.
unsetopt flow_control

if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a li ne of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

# Make ctrl-x ctrl-e edit the current command line
autoload edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

export LANG=en_US.UTF-8

alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias history='fc -il 1'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
# alias ls='ls --color=tty'
alias please='sudo '
alias sudo='sudo '


# Add local functions
fpath=($HOME/.zfunctions $fpath)

function source-if-exists () {
  test -r "$1" && source "$1" > /dev/null 2>/dev/null || true
}

source-if-exists $HOME/.opam/opam-init/init.zsh
source-if-exists $HOME/.asdf/asdf.sh
source-if-exists $HOME/.sdkman/bin/sdkman-init.sh
source-if-exists ${XDG_CONFIG_HOME:=~/.config}/fzf/fzf.zsh
# Requires apt install autojump or brew install autojump
source-if-exists /usr/share/autojump/autojump.sh
source-if-exists /usr/local/etc/profile.d/autojump.sh
source-if-exists $HOME/.config/broot/launcher/bash/br

# Synamic terminal title {{{
# Write some info to terminal title.
# This is seen when the shell prompts for input.
function _set_title_precmd {
  print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
}
# Write command and args to terminal title.
# This is seen while the shell waits for a command to complete.
function _set_title_preexec {
  printf "\033]0;%s\a" "$1"
}
precmd_functions+=(_set_title_precmd)
preexec_functions+=(_set_title_preexec)
# }}}

# Dart stuff for dart language server for flutter
export PATH=$PATH:/usr/lib/dart/bin:$HOME/.pub-cache/bin

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# Make GPG always use the current tty to prompt (in non gui environments)
export GPG_TTY=$(tty)

# OS Specific optional overrides
# .zshrc-Darwin for osx
# .zshrc-Linux for linux
source-if-exists "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
# Unversioned local overrides
source-if-exists "${ZDOTDIR:-${HOME}}/.zshrc.local"

# aliases for nvim profiles as created by nvims script
source-if-exists "${HOME}/.nvim_appnames"

# Nix
fpath=($HOME/.nix-profile/share/zsh/site-functions $fpath)

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias vim to nvim if exists
if type nvim > /dev/null 2>&1; then
  alias vim=nvim
fi
alias vimagit='vim +MagitOnly'

if type trash > /dev/null 2>&1; then
  alias rm='trash'
fi
if type bat > /dev/null 2>&1; then
  alias cat=bat
fi
if type mvnd > /dev/null 2>&1; then
  alias mvn=mvnd
fi

export PATH="${PATH}:/usr/local/bin/navi"

autoload zrecompile
zrecompile -p -R ~/.zshrc
