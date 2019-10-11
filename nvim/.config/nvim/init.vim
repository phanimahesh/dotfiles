" Vim configuration for J Phani Mahesh.
" ==========================================================

set nocompatible              " Don't be compatible with vi

" Unset all autocommands
autocmd!

" Reload vimrc on demand
map <silent> <leader>V :source $MYVIMRC<CR>:exe ":echo 'vimrc reloaded'"<CR>

source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugs.vim
source ~/.config/nvim/mappings.vim

" vimpress authorization. Keep separate to avoid accidental commits.
" source ~/.vimpress_auth
"
" vim: set fdm=marker ft=vim:
