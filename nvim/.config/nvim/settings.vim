" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
"set relativenumber            " Display relative line numbers
" numbers.vim is a much better alternative. Contextual line numbering.
set hidden
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Fancy new nvim 0.4 features - transparency and menu on ex-wildcomplete.
set wildoptions=pum
set pumblend=30
set winblend=30

set mouse=a  " enable mouse"
" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**


""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
" Highlight current line and column
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set synmaxcol=120           " Do not highlight after 120 columns.
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
set path=.,**               " Directories to search when using gf

set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

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
set ignorecase      " Default to using case insensitive searches,
set smartcase       " unless uppercase letters are used in the regex.
set smarttab        " Handle tabs more intelligently
set hlsearch        " Highlight searches by default.
set incsearch       " Incrementally search while typing a /regex
set wrapscan        " Searches wrap around the end of the file

" Search open windows and tabs and use them for switching from quickfix
" open new tab if not exists
set switchbuf=usetab,newtab

"""" Display
" On autocmd since it's not loaded until later
autocmd VimEnter * colorscheme apprentice
" colorscheme desert " Was great on my linux, somehow it is screwed up on Mac
" colorscheme peachpuff
if has("gui_running")
  " Remove toolbar
  set guioptions-=T
endif

" Window split settings
set splitright

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=400 " Idle time to write swap and trigger CursorHold
" set updatetime=1000 " Idle time to write swap and trigger CursorHold

" Time out on key codes
set ttimeoutlen=10

" }}}

" Neovim specific settings: {{{
if has("nvim")
  set termguicolors
  " run tests with :T
  let test#strategy = "neoterm"

  " vertical split instead of the default horizontal
  let g:neoterm_default_mod = "vertical"

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
