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

export ZPLUG_HOME=$ZDOTDIR/.zplug
ZPLUG_LOADFILE=$ZDOTDIR/.zsh-plugs
source $ZDOTDIR/.zplug/init.zsh
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

setopt auto_pushd
setopt pushd_ignore_dups

export LSCOLORS=Gxfxcxdxbxegedabagacad
command -v dircolors >/dev/null 2>&1 && eval "$(dircolors -b)"

function source-if-exists () {
  test -r "$1" && source "$1" > /dev/null 2>/dev/null || true
}

# Only retain unique entries, even if I accidentally duplicate
typeset -U custom_script_sources

custom_script_sources=(
  # History
  $ZDOTDIR/.history.zsh
  # Keybindings
  $ZDOTDIR/.keybindings.zsh

  # Various package managerish thingamajigs
  $HOME/.opam/opam-init/init.zsh
  $HOME/.sdkman/bin/sdkman-init.sh

  # fzf
  ${XDG_CONFIG_HOME:=~/.config}/fzf/fzf.zsh

  # Usual autojump locations
  /usr/share/autojump/autojump.sh
  /opt/homebrew/etc/profile.d/autojump.sh
  /usr/local/etc/profile.d/autojump.sh

  # Broot. Forgot what this is for.
  # $HOME/.config/broot/launcher/bash/br

  # aliases for nvim profiles as created by nvims script
  ~/.nvim_appnames

  # Nix daemon
  /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

  # Powerlevel 10k
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  $ZDOTDIR/.p10k.zsh

  # Path customisations
  $ZDOTDIR/.paths.zsh

  # Aliases
  $ZDOTDIR/.aliases.zsh

  # Completions
  $ZDOTDIR/.completions.zsh

  # OS Specific optional overrides
  # .zshrc-Darwin for osx
  # .zshrc-Linux for linux
  "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"
  # Unversioned local overrides
  "${ZDOTDIR:-${HOME}}/.zshrc.local"
)
# Only retain files that exist, after following symlinks
custom_script_sources=($^custom_script_sources(N-.))

for custom_script ($custom_script_sources); do source $custom_script; done

# mise is a better asdf. Multi tool version manager
if type mise > /dev/null 2>&1; then eval "$(mise activate zsh)";fi

# # Synamic terminal title {{{
# # Write some info to terminal title.
# # This is seen when the shell prompts for input.
# function _set_title_precmd {
#   print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
# }
# # Write command and args to terminal title.
# # This is seen while the shell waits for a command to complete.
# function _set_title_preexec {
#   printf "\033]0;%s\a" "$1"
# }
# precmd_functions+=(_set_title_precmd)
# preexec_functions+=(_set_title_preexec)
# # }}}

# Hook for desk activation
# [ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# compinit slows down startup significantly. dunno why.
autoload -Uz compinit && compinit

eval "$(direnv hook zsh)"
eval "$(atuin init zsh)"

autoload zrecompile
for custom_script ($custom_script_sources); do zrecompile -p -R $custom_script &>/dev/null ; done
zrecompile -p -R $ZDOTDIR/.zshrc &>/dev/null
