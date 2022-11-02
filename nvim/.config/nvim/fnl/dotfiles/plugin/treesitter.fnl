(module dotfiles.plugin.treesitter
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(let [(ok? treesitter-configs) (pcall #(require :nvim-treesitter.configs))]
  (when ok?
    (treesitter-configs.setup {:ensure_installed [:bash
                                                  :clojure
                                                  :fennel
                                                  :java
                                                  :json
                                                  :kotlin
                                                  :python
                                                  :yaml]
                               :auto_install true
                               :ignore_install [""]
                               :highlight {
                                           :enable true
                                           :disable []
                                           }
                               :autopairs {:enable true}
                               :indent {:enable true}
                               :incremental_selection {:enable true
                                                       :keymaps {:init_selection "gnn"
                                                                 :node_incremental "grn"
                                                                 :scope_incremental "grc"
                                                                 :node_decremental "grm"}
                                                       }
                               })))
