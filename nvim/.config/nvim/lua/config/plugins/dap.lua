return {
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    keys = {
      {
        '<LEADER>dT',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle UI',
      },
    },
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function(_, _)
      local py_path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(py_path)
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    keys = {
      { '<LEADER>db', '<CMD>DapToggleBreakpoint<CR>', desc = 'Toggle Breakpoint' },
      {
        '<LEADER>dB',
        function()
          require('dap').set_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
      },
      { '<LEADER>dr', '<CMD>DapToggleRepl<CR>', desc = 'Toggle REPL' },
      { '<LEADER>dc', '<CMD>DapContinue<CR>', desc = 'Continue' },
      { '<LEADER>dso', '<CMD>DapStepOver<CR>', desc = 'Over' },
      { '<LEADER>dsO', '<CMD>DapStepOut<CR>', desc = 'Out' },
      { '<LEADER>dsi', '<CMD>DapStepInto<CR>', desc = 'Into' },
      { '<LEADER>dt', '<CMD>DapTerminate<CR>', desc = 'Terminate' },
      { '<LEADER>dd', '<CMD>DapDisconnect<CR>', desc = 'Terminate' },
    },
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function(_, _)
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
