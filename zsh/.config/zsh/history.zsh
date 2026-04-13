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
