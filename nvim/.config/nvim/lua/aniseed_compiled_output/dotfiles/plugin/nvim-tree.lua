local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/plugin/nvim-tree.fnl"
local _2amodule_name_2a = "dotfiles.plugin.nvim-tree"
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
  local ok_3f, nvim_tree = nil, nil
  local function _1_()
    return require("nvim-tree")
  end
  ok_3f, nvim_tree = pcall(_1_)
  if ok_3f then
    local ok_3f0, nvim_tree_config = nil, nil
    local function _2_()
      return require("nvim-tree.config")
    end
    ok_3f0, nvim_tree_config = pcall(_2_)
    if ok_3f0 then
      do
        local tree_cb = nvim_tree_config.nvim_tree_callback
        nvim_tree.setup({update_focused_file = {enable = true, update_cwd = true}, renderer = {root_folder_modifier = ":t", icons = {glyphs = {default = "\239\146\165", symlink = "\239\146\129", folder = {arrow_open = "\239\145\188", arrow_closed = "\239\145\160", default = "\238\151\191", open = "\238\151\190", empty = "\239\132\148", empty_open = "\239\132\149", symlink = "\239\146\130", symlink_open = "\239\146\130"}, git = {unstaged = "\239\145\132", staged = "S", unmerged = "\238\156\167", renamed = "\226\158\156", untracked = "U", deleted = "\239\145\152", ignored = "\226\151\140"}}}}, diagnostics = {enable = true, show_on_dirs = true, icons = {hint = "\239\160\180", info = "\239\129\154", warning = "\239\129\177", error = "\239\129\151"}}, view = {width = 30, height = 30, side = "left", mappings = {list = {{key = {"l", "<CR>", "o"}, cb = tree_cb("edit")}, {key = "h", cb = tree_cb("close_node")}, {key = "v", cb = tree_cb("vsplit")}}}}})
      end
      util.lnnoremap("e", "NvimTreeToggle")
    else
    end
  else
  end
end
return _2amodule_2a