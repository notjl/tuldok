return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = false,
            show_end_of_buffer = true,
        })

        vim.api.nvim_command("colo catppuccin")
    end
}
