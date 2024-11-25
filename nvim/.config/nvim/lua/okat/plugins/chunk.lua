return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    chunk = {
      enable = true,
      delay = 200,
      duration = 150,
      style = {
        fg = "#b4befe",
        fg = "#f38ba8"
      },
    },
  },
}
