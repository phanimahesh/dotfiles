(module dotfiles.plugin.nvim-tree
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(let [(ok? nvim-tree) (pcall #(require :nvim-tree))]
  (when ok?
    (let [(ok? nvim-tree-config) (pcall #(require :nvim-tree.config))]
      (when ok?
        (let [tree-cb nvim-tree-config.nvim_tree_callback]
          (nvim-tree.setup {:update_focused_file {:enable true :update_cwd true}
                            :renderer {:root_folder_modifier ":t"
                                       :icons {:glyphs {:default ""
                                                        :symlink ""
                                                        :folder {:arrow_open ""
                                                                 :arrow_closed ""
                                                                 :default ""
                                                                 :open ""
                                                                 :empty ""
                                                                 :empty_open ""
                                                                 :symlink ""
                                                                 :symlink_open ""}
                                                        :git {:unstaged ""
                                                              :staged :S
                                                              :unmerged ""
                                                              :renamed "➜"
                                                              :untracked :U
                                                              :deleted ""
                                                              :ignored "◌"}}}}
                            :diagnostics {:enable true
                                          :show_on_dirs true
                                          :icons {:hint ""
                                                  :info ""
                                                  :warning ""
                                                  :error ""}}
                            :view {:width 30
                                   :height 30
                                   :side :left
                                   :mappings {:list [{:key {1 :l 2 :<CR> 3 :o}
                                                       :cb (tree-cb :edit)}
                                                      {:key :h :cb (tree-cb :close_node)}
                                                      {:key :v :cb (tree-cb :vsplit)}]}}}))
        (util.lnnoremap :e "NvimTreeToggle")
        ))))
