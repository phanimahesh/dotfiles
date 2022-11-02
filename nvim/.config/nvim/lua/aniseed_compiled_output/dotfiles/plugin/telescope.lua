local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/plugin/telescope.fnl"
local _2amodule_name_2a = "dotfiles.plugin.telescope"
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
  local ok_3f, telescope = nil, nil
  local function _1_()
    return require("telescope")
  end
  ok_3f, telescope = pcall(_1_)
  if ok_3f then
    telescope.setup({defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--follow", "-g", "!.git/"}}})
    util.lnnoremap("ff", "Telescope find_files hidden=true")
    util.lnnoremap("f-", "Telescope file_browser")
    util.lnnoremap("fg", "Telescope live_grep")
    util.lnnoremap("*", "Telescope grep_string")
    util.lnnoremap("fb", "Telescope buffers")
    util.lnnoremap("fH", "Telescope help_tags")
    util.lnnoremap("fm", "Telescope keymaps")
    util.lnnoremap("fM", "Telescope marks")
    util.lnnoremap("fh", "Telescope oldfiles")
    util.lnnoremap("ft", "Telescope filetypes")
    util.lnnoremap("fc", "Telescope commands")
    util.lnnoremap("fC", "Telescope command_history")
    util.lnnoremap("fq", "Telescope quickfix")
    util.lnnoremap("fl", "Telescope loclist")
    util.lnnoremap("fsa", "Telescope lsp_code_actions")
    util.lnnoremap("fsi", "Telescope lsp_implementations")
    util.lnnoremap("fsr", "Telescope lsp_references")
    util.lnnoremap("fsS", "Telescope lsp_document_symbols")
    util.lnnoremap("fss", "Telescope lsp_workspace_symbols")
  else
  end
end
return _2amodule_2a