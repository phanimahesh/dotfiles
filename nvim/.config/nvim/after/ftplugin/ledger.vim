set foldlevel=0

noremap <silent><buffer> <Leader>d :call ledger#transaction_date_set('.', "auxiliary")<CR>
noremap <silent><buffer> <2-LeftMouse> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
vnoremap <silent><buffer> <Leader>a :LedgerAlign<CR>
inoremap <silent><buffer> <C-l> <Esc>:call ledger#align_amount_at_cursor()<CR>
noremap <silent><buffer> <Leader>e :call ledger#entry()<CR>

let g:ledger_maxwidth = 80
let g:ledger_fillstring = '    -'
let g:ledger_detailed_first = 1
let g:ledger_fold_blanks = 1
let g:ledger_decimal_sep = '.'
let g:ledger_align_at = 60
let g:ledger_default_commodity = 'INR'
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = ' '
