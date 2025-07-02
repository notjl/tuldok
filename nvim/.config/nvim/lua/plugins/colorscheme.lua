return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      show_end_of_buffer = true,
      integrations = {
        barbar = true,
        render_markdown = true
    },
    }
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
    }
  }
}
