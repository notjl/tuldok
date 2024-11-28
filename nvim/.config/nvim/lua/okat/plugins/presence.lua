return {
  'vyfor/cord.nvim',
  build = './build || .\\build',
  event = 'VeryLazy',
  opts = {
    editor = { tooltip = 'The Superior Text Editor' },
    text = {
      viewing = 'Reading 🕵 {}',
      editing = 'Touching ✍ {}',
      file_browser = 'Browsing 👀 in {}',
      plugin_manager = 'Managing 🧑💻 in {}',
      lsp_manager = 'Configuring LSP 📚 in {}',
      vcs = 'Thonking 🤔 Changes in {}',
      workspace = 'In {}',
    }
    -- -- General Options
    -- neovim_image_text = 'neovim > vscode',
    -- main_image = 'file',
    --
    -- -- Rich Presence text options
    -- editing_text = 'Touching ✍  %s',
    -- file_explorer_text = 'Browsing 👀 %s',
    -- git_commit_text = 'Thonking 🤔 COMMIT MSG',
    -- plugin_manager_text = 'Managing 🧑💻 %s',
    -- reading_text = 'Reading 🕵 %s',
    -- workspace_text = 'Tinkering %s',
    -- line_number_text = 'Line %s out of %s',
  }
}
