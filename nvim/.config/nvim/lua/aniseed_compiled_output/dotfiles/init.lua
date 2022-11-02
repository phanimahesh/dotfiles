local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/init.fnl"
local _2amodule_name_2a = "dotfiles.init"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local nvim, plugin = autoload("aniseed.nvim"), autoload("dotfiles.plugin")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["plugin"] = plugin
nvim.o.termguicolors = true
nvim.o.mouse = "a"
nvim.o.updatetime = 500
nvim.o.timeoutlen = 500
nvim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize"
nvim.o.inccommand = "split"
nvim.ex.set("spell")
nvim.ex.set("list")
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
plugin.use("wbthomason/packer.nvim", {}, "Olical/aniseed", {}, "Olical/conjure", {}, "Olical/nvim-local-fennel", {}, "folke/which-key.nvim", {mod = "which-key"}, "nvim-telescope/telescope.nvim", {mod = "telescope", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}, "goolord/alpha-nvim", {}, "kyazdani42/nvim-tree.lua", {mod = "nvim-tree", requires = {{"kyazdani42/nvim-web-devicons"}}}, "mbbill/undotree", {mod = "undotree"}, "airblade/vim-gitgutter", {}, "akinsho/bufferline.nvim", {}, "nvim-lualine/lualine.nvim", {mod = "lualine"}, "nvim-treesitter/nvim-treesitter", {mod = "treesitter"}, "lewis6991/spellsitter.nvim", {mod = "spellsitter"}, "hrsh7th/nvim-cmp", {}, "hrsh7th/cmp-buffer", {}, "hrsh7th/cmp-path", {}, "saadparwaiz1/cmp_luasnip", {}, "hrsh7th/cmp-nvim-lsp", {}, "hrsh7th/cmp-nvim-lua", {}, "luukvbaal/stabilize.nvim", {}, "folke/tokyonight.nvim", {}, "lunarvim/darkplus.nvim", {})
nvim.ex.colorscheme("darkplus")
return _2amodule_2a