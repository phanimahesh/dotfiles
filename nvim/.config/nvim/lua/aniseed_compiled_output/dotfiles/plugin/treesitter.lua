local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/plugin/treesitter.fnl"
local _2amodule_name_2a = "dotfiles.plugin.treesitter"
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
local nvim, util = autoload("aniseed.nvim"), autoload("dotfiles.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
do
  local ok_3f, treesitter_configs = nil, nil
  local function _1_()
    return require("nvim-treesitter.configs")
  end
  ok_3f, treesitter_configs = pcall(_1_)
  if ok_3f then
    treesitter_configs.setup({ensure_installed = {"bash", "clojure", "fennel", "java", "json", "kotlin", "python", "toml", "typescript", "vim", "yaml"}, auto_install = true, ignore_install = {""}, highlight = {enable = true, disable = {}}, autopairs = {enable = true}, indent = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}})
  else
  end
end
return _2amodule_2a