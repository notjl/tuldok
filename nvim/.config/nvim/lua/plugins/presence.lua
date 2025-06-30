local function get_git_branch()
  local branch = vim.fn.system({'git', 'branch', '--show-current'}):gsub('\n', '')
  local fatal_message = "fatal: not a git repository (or any of the parent directories): .git"

  if branch:find(fatal_message, 1, true) then -- The `true` argument makes the search literal (no patterns)
    return nil
  else
    return branch
  end
end

return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    idle = {
      details = function(opts)
        local branch_suffix = opts.git_branch and string.format(' [%s]', opts.git_branch) or ''
        return string.format('Taking a break from %s%s', opts.workspace, branch_suffix)
      end,
    },
    variables = {
      git_branch = get_git_branch(),
    },
    text = {
      workspace = function(opts)
        local hour = tonumber(os.date('%H'))
        local status = 
          hour >= 22 and '🌙 Late night coding' or
          hour >= 18 and '🌆 Evening session' or
          hour >= 12 and '☀️ Afternoon coding' or
          hour >= 5 and '🌅 Morning productivity' or
          '🌙 Midnight hacking'


        return status .. (opts.git_branch and ": " .. opts.git_branch or "")
      end,
      viewing = function(opts) return '🕵️‍♂️ Viewing ' .. opts.filename end,
      editing = function(opts) return string.format('✍ Touching %s [%s] - %s:%s', opts.filename, opts.workspace, opts.cursor_line, opts.cursor_char) end,
      file_browser = function(opts) return '👀 Browsing files in ' .. opts.name end,
      plugin_manager = function(opts) return '🧑‍💻 Managing plugins in ' .. opts.name end,
      lsp = function(opts) return '📚 Configuring LSP in ' .. opts.name end,
      docs = function(opts) return '🤦‍♂️ Reading ' .. opts.name end,
      vcs = function(opts) return '🤔 Committing changes in ' .. opts.name end,
      notes = function(opts) return '📝 Taking notes in ' .. opts.name end,
      debug = function(opts) return '🐛 Debugging in ' .. opts.name end,
      test = function(opts) return '🧪 Testing in ' .. opts.name end,
      diagnostics = function(opts) return '👨‍🔧 Fixing problems in ' .. opts.name end,
      games = function(opts) return '🎮 Playing ' .. opts.name end,
      terminal = function(opts) return '🖥️ Running commands in ' .. opts.name end,
      dashboard = '🏠 Home',
    }, 
    buttons = {
      {
        label = 'View Repository',
        url = function(opts) return opts.repo_url end,
      },
    },
    hooks = {
      workspace_change = get_git_branch,
    },
  }
}
