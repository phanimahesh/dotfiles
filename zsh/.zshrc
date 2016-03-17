# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
        colored-man         # Coloured man pages
        extract             # extract <archive> for all formats.
        pass                # Command completion for pass. apt install.
        # git               # Aliases for git. I don't use 'em.
        git-extras          # Auto-complete. apt install
        git-flow            # Auto complete. apt install
        command-not-found   # enables command-not-found suggestions
        cloudapp            # uploads files and piped stuff to cloudapp.com, prints and copies url
        autojump            # A cd complement that learns. apt install
        dircycle            # Ctrl+Shift+Left/Right for cd prev directory/undo
        node                # `node-docs [section]` opens docs in browser
        npm                 # Auto completion for npm
        nvm                 # Source nvm and auto complete
        bower               # Bower completions, aliases bi,bl,bs
        # tmux
        # tmuxinator
        sudo                # ESC twice to prepend sudo.
        task                # Taskwarrior auto complete. apt install
        # python            # boring.
        pep8                # Auto complete
        pip                 # Auto complete
        rand-quote          # `quote`: Show a random quotation from http://www.quotationspage.com/random.php3
        history-substring-search # Pure awesomeness. up/down to search matching commands.
        zsh-syntax-highlighting  # in-shell highlighting ofinteractive commands. custom.
        )

source $ZSH/oh-my-zsh.sh

setopt interactivecomments

export LANG=en_US.UTF-8

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export EDITOR=nvim
alias vim=nvim
alias sudo='sudo '
# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
