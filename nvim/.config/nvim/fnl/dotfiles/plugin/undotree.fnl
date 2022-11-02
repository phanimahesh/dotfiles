(module dotfiles.plugin.undotree
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(let [(ok? undotree) (pcall #(require :undotree))]
  (when ok?
    (util.lnnoremap :ut "UndotreeToggle")))
