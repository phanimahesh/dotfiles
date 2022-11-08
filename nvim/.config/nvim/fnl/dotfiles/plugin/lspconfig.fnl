(module dotfiles.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(let [(ok? lspconfig) (pcall #(require :lspconfig))]
  (when ok?
    (lspconfig.kotlin_language_server.setup {})
    (lspconfig.jdtls.setup {})
    ))
  
