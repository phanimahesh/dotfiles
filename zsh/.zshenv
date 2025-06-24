# See https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2 on why these can't be set in ~/.zshenv :(
# Mac Os does very weird stuff and breaks path ordering.
# export PATH=~/bin:~/.local/bin:/opt/homebrew/bin:~/.cargo/bin:~/go/bin:/usr/local/bin:usr/local/sbin:$PATH
# PATH is now centralized to ~/.paths.zsh

# Re-home zsh configs
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

export EDITOR=nvim
export NVIM_APPNAME=nvim-astro # temporary local default
export MOSH_SERVER_NETWORK_TMOUT=604800
export MOSH_SERVER_SIGNAL_TMOUT=60
# sdkman is a jvm tooling manager
export SDKMAN_DIR=~/.sdkman
export MSSQL_CLI_TELEMETRY_OPTOUT=True
# Because en_IN is unrecognised by most systems :(
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Make GPG always use the current tty to prompt (in non gui environments)
export GPG_TTY=$(tty)

