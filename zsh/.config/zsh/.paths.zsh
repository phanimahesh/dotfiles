#
# Paths
#

# Export existing paths.
typeset -gxU path PATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxU mailpath MAILPATH
typeset -gxU manpath MANPATH
# Create and export new paths.
typeset -gxU infopath INFOPATH
typeset -gxU node_path NODE_PATH
# Tie the new paths.
typeset -gxTU INFOPATH infopath
typeset -gxTU NODE_PATH nodepath

# The weird default is for fallback cases and to provide sensible default.
HOMEBREW_PREFIX="$(if type brew &>/dev/null; then brew --prefix; else echo /opt/homebrew; fi)"

fpath=(
  $ZDOTDIR/.zfunctions
  $HOMEBREW_PREFIX/share/zsh-completions
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOME/.nix-profile/share/zsh-completions
  $HOME/.nix-profile/share/zsh/site-functions
  $fpath
)
fpath=($^fpath(N-/))

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
  ${GOPATH:-$HOME/go}/bin
  # Add non g-prefixed gnu tools and make them take priority over mac os's bsd tools.
  $HOMEBREW_PREFIX/opt/*/libexec/gnubin(N) # Nullglob, remove if no matches found
  /opt/homebrew/bin
  # $HOME/.rvm/bin
  # /Applications/Postgres.app/Contents/MacOS/bin
  /usr/local/{sbin,bin}
  # /usr/local/heroku/{sbin,bin}
  # /usr/local/opt/rbenv/shims
  # /usr/local/share/npm/bin
  /opt/{sbin,bin}
  /opt/local/{sbin,bin}
  /usr/{sbin,bin}
  # /usr/X11R6/bin
  /{sbin,bin}
  $path
)
path=($^path(N-/))

# Set the list of directories that cd searches for directories.
setopt auto_cd
cdpath=(
  .
  $HOME
  $HOME/workspace/deliveroo/
)
cdpath=($^cdpath(N-/))

# Set the list of directories that info searches for manuals.
infopath=(
  $HOMEBREW_PREFIX/share/info
  /usr/local/info
  /usr/local/share/info
  /usr/share/info
)
infopath=($^infopath(N-/))

# Set the list of directories that man searches for manuals.
manpath=(
  $HOMEBREW_PREFIX/share/man
  $HOMEBREW_PREFIX/opt/*/libexec/gnuman(N) # Nullglob, remove if no matches found
  /usr/local/man
  /usr/local/share/man
  /usr/share/man
)
manpath=($^manpath(N-/))

# Set the list of directories that zsh searches for mail.
mailpath=(
  $mailpath
)
mailpath=($^mailpath(N-/))

# Set the list of directories that node.js searches for modules.
nodepath=(
  /usr/local/share/npm/lib/node_modules
  /usr/local/lib/node_modules
  ./node_modules
)
