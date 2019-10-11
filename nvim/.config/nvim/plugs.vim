" Plugins included
" ==========================================================
"
" Vim-Plug
"    Plugin manager for vim.
"    I like it more than pathogen, Vundle, Neo-Bundle
let g:plug_shallow=1
" Setup vim-plug paths {{{
if has("nvim")
  let s:vim_plug_path='~/.config/nvim/autoload/plug.vim'
  let s:plugin_bundle_path='~/.config/nvim/bundle'
else
  let s:vim_plug_path='~/.vim/autoload/plug.vim'
  let s:plugin_bundle_path='~/.vim/bundle'
endif
if empty(glob(s:vim_plug_path))
  echo "Please install vim-plug"
endif
" }}} End installation

call plug#begin(s:plugin_bundle_path)

" Color Schemes {{{
" ----------------------------------------------------------
Plug 'chriskempson/base16-vim'
Plug 'romainl/apprentice'
Plug 'morhetz/gruvbox'
Plug 'croaker/mustang-vim'
Plug 'tpope/vim-vividchalk'
Plug 'arzg/vim-substrata'
Plug 'doums/darcula'
Plug 'phanimahesh/clouds_midnight.vim'
" }}} End color schemes

" Always enabled Plugins
" ----------------------------------------------------------
"
" Editor config.
"     An editor agnostic specification for common settings
Plug 'editorconfig/editorconfig-vim'

" FAQ
Plug 'chrisbra/vim_faq'

" Minimalist statusline
Plug 'itchyny/lightline.vim'
" This shows mode in statusline, so get rid of redundant --INSERT--
set noshowmode
" Lightline Config and Functions {{{
" active, inactive select buffers
" left/right select statusline side.
" left has 2 lists, right has 3.
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \   'mode': 'LightlineMode',
      \   'cocstatus': 'coc#status',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'unite' ? unite#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction
let g:unite_force_overwrite_statusline = 0

function! LightlineMode()
  return expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ lightline#mode()
endfunction

" End Lightline Config andFunctions }}}
" Allow loading local .vimrc files on per project basis.
Plug 'MarcWeber/vim-addon-local-vimrc'

" Enable vim to understand filename:line:col and other common stacktrace
" formats.
Plug 'kopischke/vim-fetch'

" Send commands to terminal split using :T
Plug 'kassio/neoterm'

" Copy things to system clipboard
" cp<motion> -> copy <motion>
" cP -> copy current line
" cv -> paste from system clipboard
Plug 'christoomey/vim-system-copy'

" Completion {{{
"" YouCompleteMe
""     The most awesome autocompleter for vim
"" Plug 'Valloric/YouCompleteMe', { 'do': 'YCM_CORES= $(( `getconf _NPROCESSORS_ONLN` - 1 )) ./install.py' }
"" Or should I use Deoplete?
"" Deoplete and recommendations {{{
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
"Plug 'Shougo/neopairs.vim'
"Plug 'Konfekt/FastFold'
"Plug 'Shougo/context_filetype.vim'
"let g:deoplete#enable_at_startup = 0
"let g:deoplete#sources = {}
"let g:deoplete#ignore_sources = {}
"let g:deoplete#keyword_patterns = {}
""
"" Completion sources for Deoplete {{{
"Plug 'Shougo/neco-vim'
"Plug 'zchee/deoplete-go', { 'do': 'make'}

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"" End Completion sources}}}
""
"" End Deoplete }}}
"
" coc.nvim looks much better, interfacing with language servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" End Completion }}}

" Syntax highlighting - lazy loaded for many languages
Plug 'sheerun/vim-polyglot'

" Numbers
"    Context sensitive numbering.
"    Absolute in insert mode and relative in normal.
Plug 'vim-scripts/numbers.vim'
"
" Fugitive
"    Interface with git from vim
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
"
" Abolish
"    Spelling coercions, substitutions, identifier coercions
Plug 'tpope/vim-abolish'
"
" Repeat
"    Let plugins do proper repeating with .
Plug 'tpope/vim-repeat'

"    Highlight the optimum keys to target with f,F,t,T
Plug 'unblevable/quick-scope'
" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/vmap instead of their non-recursive versions (nnoremap/vnoremap).
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

Plug 'airblade/vim-rooter'
let g:rooter_disable_map = 1
" let g:rooter_manual_only = 1
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_change_directory_for_non_project_files = 0
let g:rooter_patterns = [ 'Cargo.toml', 'mix.exs', 'package.json', '.git', '.git/', '.hg/' ]


let unite_commands = [ 'Unite', 'UniteBookmarkAdd', 'UniteClose', 'UniteDo', 'UniteFirst', 'UniteLast', 'UniteNext', 'UnitePrevious', 'UniteResume', 'UniteWithBufferDir', 'UniteWithCurrentDir', 'UniteWithCursorWord', 'UniteWithInput', 'UniteWithInputDirectory', 'UniteWithProjectDir']
Plug 'Shougo/unite.vim', {'on': unite_commands}
nnoremap <leader>- :Unite buffer<CR>

Plug 'Shougo/denite.nvim'
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" On-demand loaded Plugins
" ----------------------------------------------------------
"
" NerdTree
"    File browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Open NerdTree
map <F2> :NERDTreeToggle<CR>
"
" FZF - fuzzy finder
Plug 'junegunn/fzf'
map <F3> :FZF<CR>
"
" Neco-ghc
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
Plug 'parsonsmatt/intero-neovim', {'for': 'haskell'}
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END
" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
" Enable type information on hover (when holding cursor at point for ~1 second).
let g:intero_type_on_hover = 1
" Change the intero window size; default is 10.
let g:intero_window_size = 15

"
" MunDo
"     Visual Undo in vim with diff's to check the differences
Plug 'simnalamburt/vim-mundo', {'on': ['MundoToggle', 'MundoShow', 'MundoHide', 'MundoRenderGraph']}
" Load the Mundo window
map <leader>u :MundoToggle<CR>
"
" Rainbow CSV
"     Highlights different columns of CSV in different colors
Plug 'vim-scripts/rainbow_csv.vim', {'for': 'csv'}

" =========== End of manually reviewed stuff. =========

Plug 'scrooloose/syntastic'

Plug 'raimondi/delimitmate'
Plug 'tpope/vim-obsession'

"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/snipmate-snippets'
"
" Surround
"    Allows you to surround text with open/close tags
" Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
"
" prefer ag when available
if executable('rg')
  set grepprg=rg
endif

Plug 'vim-scripts/TaskList.vim'
" Toggle the tasklist
map <leader>td <Plug>TaskList
Plug 'marcweber/vim-addon-mw-utils'
" Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'def-lkb/merlin'
Plug 'sukima/xmledit', {'for': ['xslt', 'xml']}
" XSLT
"    Depends on xmledit
Plug 'vim-scripts/xslt', {'for': ['xslt', 'xml']}
Plug 'vim-scripts/XSLT-syntax', {'for': ['xslt', 'xml']}
" Zencoding has been renamed to emmet
Plug 'vim-scripts/emmet.vim', {'for': ['xml', 'xslt', 'html']}
Plug 'vim-scripts/fuzzyfinder'
Plug 'vim-scripts/l9'
Plug 'vim-scripts/vim-vagrant'
Plug 'vim-scripts/autoscroll.vim'
" Plug 'guyzmo/notmuch-abook'
" Plug 'phanimahesh/VimRepress'
Plug 'mattboehm/vim-unstack'
Plug 'mattboehm/vim-accordion'

Plug 'ledger/vim-ledger'

Plug 'sjl/splice.vim'

" Gitgutter
"    Show git status stuff in vim gutter.
Plug 'airblade/vim-gitgutter'

Plug 'janko-m/vim-test'
" Define additional top-level commands in vim for each entry in this array.
let g:test#runner_commands = ['ExUnit']
" " vim-test maps. I don't use them much.
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>
" Plug 'phanimahesh/vim-elixir', {'branch': 'curated', 'for': 'elixir'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': './install.sh' } " Provides a elixir remote,
let g:elixir_docpreview = 1
let g:elixir_showerror = 1
" let g:elixir_autobuild = 1
let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_elixir_mix_maker = {
      \ 'args': ['compile'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'lucidstack/hex.vim'


Plug 'jceb/vim-orgmode'

" Plug 'joedicastro/vim-pentadactyl'
Plug 'sorah/presen.vim'
Plug 'terryma/vim-multiple-cursors'
"
"" Custom text objects {{{
" Library to define custom test objects
Plug 'kana/vim-textobj-user'
" ae -> entire buffer
" ie -> entire buffer minus newlines at beginning and end
Plug 'kana/vim-textobj-entire'
" ii -> stuff indented at same level
Plug 'kana/vim-textobj-indent'
" il -> current line minus leading whitespace
Plug 'kana/vim-textobj-line'
"}}}
"
" Libraries {{{
"
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'benekastah/neomake'
Plug 'mattn/webapi-vim'
"}}}
"
" Fancy icons everywhere
Plug 'ryanoasis/vim-devicons'
call plug#end()
