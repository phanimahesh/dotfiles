" Vim configuration for J Phani Mahesh.
" ==========================================================

set nocompatible              " Don't be compatible with vi
" let mapleader=","             " change the leader to be a comma vs slash
set mouse=a

" Unset all autocommands
autocmd!

" Assume I have python neovim package installed properly
" Speeds up startup in neovim.
let g:python3_host_skip_check=1
" Reload vimrc on demand
map <silent> <leader>V :source $MYVIMRC<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Plugins included
" ==========================================================
"
" Vim-Plug
"    Plugin manager for vim.
"    I like it more than pathogen, Vundle, Neo-Bundle
let g:plug_shallow=1
" Install vim-plug if missing {{{
if has("nvim")
  let s:vim_plug_path='~/.config/nvim/autoload/plug.vim'
  let s:plugin_bundle_path='~/.config/nvim/bundle'
else
  let s:vim_plug_path='~/.vim/autoload/plug.vim'
  let s:plugin_bundle_path='~/.vim/bundle'
endif
if empty(glob(s:vim_plug_path))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "vim-plug has just been automatically installed. Verify authenticity if desired."
  echo "Press enter to install plugins"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" }}} End installation

call plug#begin(s:plugin_bundle_path)

" Color Schemes {{{
" ----------------------------------------------------------
Plug 'romainl/apprentice'
Plug 'morhetz/gruvbox'
Plug 'croaker/mustang-vim'
Plug 'tpope/vim-vividchalk'
Plug 'phanimahesh/clouds_midnight.vim'
" }}} End color schemes

" Always enabled Plugins
" ----------------------------------------------------------
"
" Editor config.
"     An editor agnostic specification for common settings
Plug 'editorconfig/editorconfig-vim'

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

" YouCompleteMe
"     The most awesome autocompleter for vim
" Plug 'Valloric/YouCompleteMe', { 'do': 'YCM_CORES= $(( `getconf _NPROCESSORS_ONLN` - 1 )) ./install.py' }
" Or should I use Deoplete?
" Deoplete and recommendations {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Konfekt/FastFold'
Plug 'Shougo/context_filetype.vim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#keyword_patterns = {}
"
" Completion sources for Deoplete {{{
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'SevereOverfl0w/deoplete-github'
" let g:deoplete#sources.gitcommit=['github']
" let g:deoplete#keyword_patterns.gitcommit = '.+'

" autocmd! User deoplete-github call deoplete#util#set_pattern(
"   \ g:deoplete#omni#input_patterns,
"   \ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])

" End Completion sources}}}
"
" End Deoplete }}}

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
let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_patterns = [ 'README.md', 'mix.exs', 'package.json', '.git', '.git/', '.hg/' ]


let unite_commands = [ 'Unite', 'UniteBookmarkAdd', 'UniteClose', 'UniteDo', 'UniteFirst', 'UniteLast', 'UniteNext', 'UnitePrevious', 'UniteResume', 'UniteWithBufferDir', 'UniteWithCurrentDir', 'UniteWithCursorWord', 'UniteWithInput', 'UniteWithInputDirectory', 'UniteWithProjectDir']
Plug 'Shougo/unite.vim', {'on': unite_commands}
nnoremap <leader>- :Unite buffer<CR>
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
Plug 'eagletmt/neco-ghc'
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
"
" MunDo
"     Visual Undo in vim with diff's to check the differences
Plug 'simnalamburt/vim-mundo', {'on': ['MundoToggle', 'MundoShow', 'MundoHide', 'MundoRenderGraph']}
" Load the Mundo window
map <leader>g :MundoToggle<CR>
"
" Rainbow CSV
"     Highlights different columns of CSV in different colors
Plug 'vim-scripts/rainbow_csv.vim', {'for': 'csv'}
"
" Git
"    Git config goodness
Plug 'tpope/vim-git', { 'for': ['gitconfig','git','gitrebase','gitsendemail','gitcommit']}
"
" Less
"    Less syntax and autocompletion
Plug 'groenewege/vim-less', { 'for': 'less' }
"
" CSS3
"    CSS3 syntax
Plug 'hail2u/vim-css3-syntax', { 'for': ['css','less'] } " vim-less can use this too.
" =========== End of manually reviewed stuff. =========

Plug 'klen/python-mode', {'for': 'python' }
" Quick Radon
"    Reporting for python code
"       - Cyclomatic Complexity
"       - Metrics (SLOC, LOC, Comments, ...)
"       - Maintainability Index
Plug 'vim-scripts/vim-quick-radon', {'for': 'python', 'on': 'QuickRadon'}

Plug 'scrooloose/syntastic'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-obsession'
Plug 'kchmck/vim-coffee-script'
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/snipmate-snippets'
"
" Surround
"    Allows you to surround text with open/close tags
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
"
" prefer ag when available
if executable('ag')
  set grepprg=ag
endif

Plug 'vim-scripts/TaskList.vim'
" Toggle the tasklist
map <leader>td <Plug>TaskList
Plug 'marcweber/vim-addon-mw-utils'
" Plug 'altercation/vim-colors-solarized'
Plug 'plasticboy/vim-markdown'
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
Plug 'guyzmo/notmuch-abook'
Plug 'phanimahesh/VimRepress'
Plug 'mattboehm/vim-unstack'
Plug 'mattboehm/vim-accordion'

Plug 'ledger/vim-ledger'

"
" Vim-LS
"    Livescript tools. Syntax, :LiveScript{Compile,Make,Run}
Plug 'gkz/vim-ls', {'on': ['LiveScriptCompile','LiveScriptMake','LiveScriptRun'], 'for': 'ls'}
let ls_compile_vert=1
autocmd BufWritePost *.ls silent LiveScriptMake! -b -o /tmp | cwindow | redraw!
autocmd BufNewFile,BufReadPost *.ls setlocal foldmethod=indent shiftwidth=2 expandtab

Plug 'sjl/splice.vim'
Plug 'kylef/apiblueprint.vim',{'for': 'apiblueprint'}

" Gitgutter
"    Show git status stuff in vim gutter.
Plug 'airblade/vim-gitgutter'

Plug 'janko-m/vim-test'
" Define additional top-level commands in vim for each entry in this array.
let g:test#runner_commands = ['ExUnit']
" " vim-test maps. I don't use them much.
" map <silent> <leader>t :TestNearest<CR>
" map <silent> <leader>f :TestFile<CR>
" map <silent> <leader>T :TestSuite<CR>
" map <silent> <leader>r :TestLast<CR>
" map <silent> <leader>g :TestVisit<CR>
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

" autocmd BufWritePost *.ex Neomake!

Plug 'jceb/vim-orgmode'

Plug 'joedicastro/vim-pentadactyl'
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
call plug#end()
" ==========================================================
" Shortcuts
" ==========================================================

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" sudo write this
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
cmap W! w !sudo tee % >/dev/null

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

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Map tab and shift-tab to switch buffers.
nmap <silent> <tab> :bn<cr>
nmap <silent> <S-tab> :bp<cr>

" TODO: XXX
" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
"set relativenumber            " Display relative line numbers
" numbers.vim is a much better alternative. Contextual line numbering.
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Set working directory to that of current file
nnoremap <leader>. :lcd %:p:h<CR>

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
" Highlight current line and column
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=2               " <tab> inserts 2 spaces
set shiftwidth=2            " indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" Setup backups, swaps and persistent undo.
set backup
set backupcopy=yes
set backupdir=~/.vim-backups/backups//
set swapfile
set directory=~/.vim-backups/swap//
set undofile
set undodir=~/.vim-backups/undo//
" create needed directories if they don't exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

" Disable writing vim settings and options into session files
set sessionoptions-=options

" Change directory to the opened file automatically
set autochdir

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%n]\ %f%=[%l:%v]%m%w%y "\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:»-,eol:¶,trail:-,precedes:»,extends:«
" set list " I will enable this on demand.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
" colorscheme desert " Was great on my linux, somehow it is screwed up on Mac
" colorscheme peachpuff
colorscheme apprentice
if has("gui_running")
  " Remove toolbar
  set guioptions-=T
endif

" Better indentation.
" Vim retains selection so you can >,< multiple times
vnoremap < <gv
vnoremap > >gv

" Paste from clipboard
map <leader>p "+p

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Map semicolon to colon. Default action of repeating prev f/t is not used
" often. Map ;; to ; to use it when needed.
" noremap ; :
" noremap ;; ;

" Uncomment to see a line marking the collumn 79
" set colorcolumn=79

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" Neovim specific settings: {{{
if has("nvim")

  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " run tests with :T
  let test#strategy = "neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_position = "vertical"

  """ Terminal settings {{{
  " I keep forgetting the terminal escape sequence. Also, leader escape is nicer.
  tnoremap <Leader><ESC> <C-\><C-n>
  " This lets me differentiate vim cursor from terminal cursor.
  highlight TermCursor ctermfg=red guifg=red
  " Switch terminals to insertmode on entering them.
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
" }}}
endif
" Neovim specific settings }}}



" Window split settings
set splitright
"

" vimpress authorization. Keep separate to avoid accidental commits.
" source ~/.vimpress_auth
"
" vim: set fdm=marker ft=vim:
