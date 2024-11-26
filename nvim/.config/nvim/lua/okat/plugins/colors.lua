local theme_colors = require("catppuccin.palettes").get_palette("macchiato")

return {
  {
    'NvChad/nvim-colorizer.lua',
    event = "BufReadPre",
    opts = true,
  },

  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = { colors = theme_colors },
  }
}
