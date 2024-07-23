return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      transparent_background = true,
      show_end_of_buffer = true,
    })
    vim.api.nvim_command('colo catppuccin')
  end
}
