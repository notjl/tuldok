return {
  "https://github.com/fresh2dev/zellij.vim.git",
  lazy = false,
  init = function()
    vim.g.zelli_navigator_move_focus_or_tab = 1
    vim.g.zellij_navigator_disable_autolock = 1
  end,
}
