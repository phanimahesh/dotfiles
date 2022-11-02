local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/plugin/undotree.fnl"
local _2amodule_name_2a = "dotfiles.plugin.undotree"
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
  local ok_3f, undotree = nil, nil
  local function _1_()
    return require("undotree")
  end
  ok_3f, undotree = pcall(_1_)
  if ok_3f then
    util.lnnoremap("ut", "UndotreeToggle")
  else
  end
end
return _2amodule_2a