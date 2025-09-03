(module dotfiles.plugin.rust-tools
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})


(let [(ok? rt) (pcall #(require :rust-tools))]
  (when ok?
    (rt.setup
      {:server {
        :on_attach (fn [_ bufnr]
          (util.nnoremap "<C-space>" rt.hover_actions.hover_actions {:buffer bufnr})
          (util.nnoremap :a rt.code_action_group.code_action_group {:buffer bufnr})
          )}})))
