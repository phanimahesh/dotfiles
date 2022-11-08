(module dotfiles.plugin
  {autoload {a aniseed.core
             packer packer}})

;; Copied from nvim-magic-kit and adapted

; (local dbg-print? true)
(local dbg-print? false)

(defn- dpr [str]
  "Debug print stuff. Can be toggled on or off easily."
  (when dbg-print? (print str)))

(defn- safe-require-plugin-config [name]
  "Safely require a module under the dotfiles.plugin.* prefix. Will catch errors
  and print them while continuing execution, allowing other plugins to load
  even if one configuration module is broken.
  
  Falls back to requiring the module and calling setup if module is not found.
  "
  (let [(ok? val-or-err) (pcall require (.. "dotfiles.plugin." name))]
    (if (not ok?)
      (do
        (dpr (.. "Could not load dotfiles.plugin." name "\n" val-or-err))
      (let [(plain-require-ok? mod) (pcall require name)]
        (if plain-require-ok?
          (let [(setup-ok? setup-result-or-err) (pcall (. mod :setup) {})]
            (if (not setup-ok?)
              (print (.. "Could not call setup: " setup-result-or-err))
            (dpr (.. "successfully called setup for: " name " and it returned " (or setup-result-or-err "nil")))))
          (print (.. "could not require module: " mod " \nMaybe you need a module dotfiles.plugin." name))
          ))
      )
      (dpr (.. "loaded dotfiles.plugin." name)))))

(defn req [name]
  "A shortcut to building a require string for your plugin
  configuration. Intended for use with packer's config or setup
  configuration options. Will prefix the name with `dotfiles.plugin.`
  before requiring."
  (.. "require('dotfiles.plugin." name "')"))

(defn- run-simple-setup [name]
  "Simply run setup on the provided module"
  (let [(ok? mod) (pcall require mod)]
    (when ok?
      (let [(ok? val-or-err) (pcall (. mod :setup) {})]
        (when (not ok?)
          (print (.. "Error when calling setup: " val-or-err)))))))

(defn use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well.

  This is just a helper / syntax sugar function to make interacting with packer
  a little more concise."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))
      {:config {:display {:open_fun (. (require :packer.util) :float)}}}))

  nil)
