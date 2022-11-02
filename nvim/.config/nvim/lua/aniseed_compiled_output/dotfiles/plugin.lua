local _2afile_2a = ".dev/config/nvim/fnl/dotfiles/plugin.fnl"
local _2amodule_name_2a = "dotfiles.plugin"
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
local a, packer = autoload("aniseed.core"), autoload("packer")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["packer"] = packer
local dbg_print_3f = false
local function dpr(str)
  if dbg_print_3f then
    return print(str)
  else
    return nil
  end
end
_2amodule_locals_2a["dpr"] = dpr
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("dotfiles.plugin." .. name))
  if not ok_3f then
    dpr(("Could not load dotfiles.plugin." .. name .. "\n" .. val_or_err))
    local plain_require_ok_3f, mod = pcall(require, name)
    if plain_require_ok_3f then
      local setup_ok_3f, setup_result_or_err = pcall(mod.setup, {})
      if not setup_ok_3f then
        return print(("Could not call setup: " .. setup_result_or_err))
      else
        return dpr(("successfully called setup for: " .. name .. " and it returned " .. (setup_result_or_err or "nil")))
      end
    else
      return print(("could not require module: " .. mod .. " \nMaybe you need a module dotfiles.plugin." .. name))
    end
  else
    return dpr(("loaded dotfiles.plugin." .. name))
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function req(name)
  return ("require('dotfiles.plugin." .. name .. "')")
end
_2amodule_2a["req"] = req
local function run_simple_setup(name)
  local ok_3f, mod = pcall(require, mod)
  if ok_3f then
    local ok_3f0, val_or_err = pcall(mod.setup, {})
    if not ok_3f0 then
      return print(("Error when calling setup: " .. val_or_err))
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_locals_2a["run-simple-setup"] = run_simple_setup
local function use(...)
  do
    local pkgs = {...}
    local function _7_(use0)
      for i = 1, a.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _8_ = opts.mod
          if (nil ~= _8_) then
            safe_require_plugin_config(_8_)
          else
          end
        end
        use0(a.assoc(opts, 1, name))
      end
      return nil
    end
    packer.startup(_7_)
  end
  return nil
end
_2amodule_2a["use"] = use
return _2amodule_2a