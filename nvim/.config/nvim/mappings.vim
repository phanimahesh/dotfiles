" ==========================================================
" Shortcuts
" ==========================================================

" Note: vmap maps both select and visual. xmap maps only on visual.
" Prefer xmap/xnoremap to vmap/vnoremap.

" Set working directory to that of current file
nnoremap <leader>. :lcd %:p:h<CR>

" Saving {{{
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" sudo write this
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
cmap W! w !sudo tee % >/dev/null

" Fast saving
nnoremap <Leader>w :write<CR>
vnoremap <Leader>w <Esc>:write<CR>
nnoremap <C-s> :<C-u>write<CR>
vnoremap <C-s> :<C-u>write<CR>
cnoremap <C-s> <C-u>write<CR>

" End Saving }}}

" XXX: I have no idea what these do. Forgot.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" open/close the quickfix window
nmap <leader>C :copen<CR>
nmap <leader>c :cwindow<CR>
nmap <leader>cc :cclose<CR>

" open/close the location list window
nmap <leader>L :lopen<CR>
nmap <leader>l :lwindow<CR>
nmap <leader>lc :lclose<CR>
" Location list movement
nmap <Leader>j :lnext<CR>
nmap <Leader>k :lprev<CR>

" Window control
nnoremap <C-x> <C-w>x<C-w>w
nnoremap <silent><C-w>z :vert resize<CR>:resize<CR>:normal! ze<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" On my bluetoth foldable keyboard using <Esc> is a pain.
" map jk to <Esc>
imap jk <Esc>
imap kj <Esc>

" Map tab and shift-tab to switch buffers.
nmap <silent> <tab> :bn<cr>
nmap <silent> <S-tab> :bp<cr>

" Better indentation.
" Vim retains selection so you can >,< multiple times
xnoremap < <gv
xnoremap > >gv
" Use tab for indenting
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nmap >>  >>_
nmap <<  <<_

" Reload current buffer
nnoremap <leader>ee :edit!<cr>

" Paste from clipboard
map <leader>p "+p

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :<C-u>silent! keeppatterns %s/\s\+$//e<CR>

" Uncomment to see a line marking the collumn 79
" set colorcolumn=79

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Start new line from any cursor position
inoremap <S-Return> <C-o>o

" Scroll view right/left slightly more easily
nnoremap zl z5l
nnoremap zh z5h
" zz, zt, zb scrolls view to center, top/bottom current line.
" cursor doesn't change for all z commands
" C-y, C-e scroll one line up/down in view keeping cursor.

" C-u, C-d - one page up/down keeping cursor on same part of screen.
" Cursor shifts by one page.

" Change current word in a repeatable manner
nnoremap <leader>cn *``cgn
nnoremap <leader>cN *``cgN

" Change selected word in a repeatable manner
xnoremap <expr> <leader>cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
xnoremap <expr> <leader>cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Drag current line/s vertically and auto-indent
xnoremap mk :m-2<CR>gv=gv
xnoremap mj :m'>+<CR>gv=gv
noremap  mk :m-2<CR>
noremap  mj :m+<CR>

" Session management shortcuts
nmap <silent> <Leader>se :<C-u>execute 'SessionSave' fnamemodify(resolve(getcwd()), ':p:gs?/?_?')<CR>
nmap <silent> <Leader>os :<C-u>execute 'source '.g:session_directory.'/'.fnamemodify(resolve(getcwd()), ':p:gs?/?_?').'.vim'<CR>

" Append modeline to EOF {{{
nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
	let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
				\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction "}}}
" }}}

" vim: set fdm=marker ts=2 sw=2 tw=0 noet :
