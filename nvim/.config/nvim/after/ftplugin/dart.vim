setlocal autoread
" Autoread is known to be buggy. Solutions aren't nice.
if !exists('g:did_load_flutterfmt')
  let g:did_load_flutterfmt = 1
  nnoremap <buffer><silent> <leader>f  :w <bar> :execute '!flutter format %' <bar> :e <CR>
endif
