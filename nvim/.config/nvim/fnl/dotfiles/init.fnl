(module dotfiles.init
  {autoload {plugin dotfiles.plugin
             nvim aniseed.nvim}})

;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

(nvim.ex.set :spell)
(nvim.ex.set :list)

;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")


;;; Plugins

(plugin.use
  ;; Bootstrap - let packer manage packer
  :wbthomason/packer.nvim {}

  ;; Aniseed compiles our fennel code and provides the module system
  :Olical/aniseed {}
  ;; Conjure is a lisp ide in vim. Eval expressions, files, use REPL, etc
  :Olical/conjure {}
  ;; Allows using local nvim config files (in fennel) per project similar to local vimrc
  :Olical/nvim-local-fennel {}

  ;; Interactive keybinding navigator.
  ;; Presents UI with possibilities when user pauses after inputting partial mapping
  :folke/which-key.nvim {:mod :which-key}

  ;; Fuzzy finder with popup - use for find file, usage, search results, whatever
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}

  ;; Make custom start page for nvim
  :goolord/alpha-nvim {}

  ;; File browser
  :kyazdani42/nvim-tree.lua {:mod :nvim-tree :requires [[:kyazdani42/nvim-web-devicons]]}

  ;; Undo management
  :mbbill/undotree {:mod :undotree}

  ;; Gutter signs for Git hunks - Additions, deletions, changes
  :airblade/vim-gitgutter {}

;;   ;; Installer for Language servers, Linters, Debug Adapters
;;   :williamboman/mason.nvim {:mod :mason} ; generic installer for language servers, dap, etc
;;   :williamboman/mason-lspconfig.nvim {} ; language server installer
;;   :neovim/nvim-lspconfig {:mod :lspconfig}

  :akinsho/bufferline.nvim {}

  :nvim-lualine/lualine.nvim {:mod :lualine}

  
  ;; Treesitter is a generic language parser and
  ;; this plugin provides good highlighting indentation, folding etc
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  ;; Enable Neovim's builtin spellchecker for buffers with tree-sitter highlighting.
  ;; Restricts spellchecking to comments so that code isn't fully red-lined
  :lewis6991/spellsitter.nvim {:mod :spellsitter}

;;   :PeterRincker/vim-argumentative {}
;;   :clojure-vim/clojure.vim {}
;;   :clojure-vim/vim-jack-in {}
;;   :ggandor/lightspeed.nvim {}
;;   :guns/vim-sexp {:mod :sexp}
;;   ;; :hrsh7th/nvim-compe {:mod :compe}
;;   ; compare wit windwp/auto-pairs
;;   :jiangmiao/auto-pairs {:mod :auto-pairs}
;;   :numToStr/Comment.nvim {}
;;   :lewis6991/impatient.nvim {}
;;   :liuchengxu/vim-better-default {:mod :better-default}
;;   :radenling/vim-dispatch-neovim {}
;;   :tami5/compe-conjure {}
;;   :tpope/vim-abolish {}
;;   :tpope/vim-commentary {}
;;   :tpope/vim-dispatch {}
;;   :tpope/vim-eunuch {}
;;   :tpope/vim-fugitive {}
;;   :tpope/vim-repeat {}
;;   :tpope/vim-sexp-mappings-for-regular-people {}
;;   :tpope/vim-sleuth {}
;;   :tpope/vim-surround {}
;;   :tpope/vim-unimpaired {}
;;   :tpope/vim-vinegar {}
;;   ; :w0rp/ale {:mod :ale}
;;   :akinsho/toggleterm.nvim {}
;;   :ahmedkhalf/project.nvim {}
;; 
;; 
   ; -- cmp plugins
   :hrsh7th/nvim-cmp {} ; -- The completion plugin
   :hrsh7th/cmp-buffer {} ; -- buffer completions
   :hrsh7th/cmp-path {} ; -- path completions
   :saadparwaiz1/cmp_luasnip {} ; -- snippet completions
   :hrsh7th/cmp-nvim-lsp {} ;
   :hrsh7th/cmp-nvim-lua {} ;
;; 
;; 
;;   ; TODO snippets
;;   ; consider L3MON4D3/LuaSnip and rafamadriz/friendly-snippets
;; 
;;   ; Debug tools and DAP
;;   :mfussenegger/nvim-dap {}
;;   :rcarriga/nvim-dap-ui {}
;;   :ravenxrz/DAPInstall.nvim {}
;; 
  ; Miscellaneous quality of life improvements
  :luukvbaal/stabilize.nvim {}
  ; Colorschemes
  :folke/tokyonight.nvim {}
  :lunarvim/darkplus.nvim {}
  ; :marko-cerovac/material.nvim {:mod :material}

  )

(nvim.ex.colorscheme :darkplus)
