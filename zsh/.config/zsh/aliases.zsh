
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias history='fc -il 1'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
# alias ls='ls --color=tty'
alias please='sudo '
alias sudo='sudo '

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
