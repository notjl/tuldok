return {
    "andweeb/presence.nvim",
    config = function()
        require("presence"):setup({
            -- General options --
            neovim_image_text   = "neovim > vscode",
            main_image          = "file",
            
            -- Rich Presence text options --
            editing_text        = "Touching ✍️  %s",
            file_explorer_text  = "Browsing 👀 %s",
            git_commit_text     = "Thonking 🤔 COMMIT MSG",
            plugin_manager_text = "Managing 🧑‍💻 %s",
            reading_text        = "Reading 🕵️ %s",
            workspace_text      = "Tinkering %s",
            line_number_text    = "Line %s out of %s",
        })
    end,
}
