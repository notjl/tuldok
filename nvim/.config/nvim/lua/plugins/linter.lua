vim.api.nvim_create_user_command('LintInfo', function()
  local filetype = vim.bo.filetype
  local linters = require('lint').linters_by_ft[filetype]

  if linters then
    print('Linters for ' .. filetype .. ': ' .. table.concat(linters, ', '))
  else
    print('No linters configured for filetype: ' .. filetype)
  end
end, {})

return {
  'mfussenegger/nvim-lint',
  -- event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  event = { 'BufReadPre' },
  opts = {
    rust = { 'bacon' },
    c = { 'cpplint' },
    cpp = { 'cpplint' },
    javascript = { 'eslint_d' },
    typescript = { 'eslint_d' },
    go = { 'nilaway', 'revive' },
    python = { 'ruff' },
    -- lua = { 'selene' },
  },
  config = function(_, opts)
    require('lint').linters_by_ft = opts
    -- local cpplint = require('lint').linters.cpplint
    -- cpplint.args = {
    --   '--filter=-legal/copyright',
    -- }
    -- require('lint').linters.cpplint = {
    --   args = { '--filter=-legal/copyright' },
    --   cmd = 'linter_cmd',
    --   parser = require('lint.parser').from_errorformat(),
    -- }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
