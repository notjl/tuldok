-- Inspired by Evline config by shadmansaleh @ https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine
-- Guided by catppuccin lualine config @ https://github.com/catppuccin/nvim/blob/main/lua/lualine/themes/catppuccin.lua
-- and also by https://github.com/nvim-lualine/lualine.nvim/blob/e37d5d325da9c472c73d97bd0210c480c5d9babc/lua/lualine/utils/mode.lua
-- for every mode available in vim.
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = function()
    local C = require('catppuccin.palettes').get_palette('mocha')
    local O = require('catppuccin').options

    local transparent_bg = O.transparent_background and 'NONE' or C.mantle

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,

      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,

      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        disabled_filetypes = {
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lspsagaoutline',
        },
        component_separators = '',
        section_separators = '',
        theme = {
          normal = {
            c = {
              bg = transparent_bg,
              fg = C.text,
            },
          },
          inactive = {
            c = {
              bg = transparent_bg,
              fg = C.overlay0,
            },
          },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }

    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    insert_left({
      function()
        local symbol = {
          n = '󰊪',
          no = '󰊪',
          nov = '󰊪',
          noV = '󰊪',
          ['no\22'] = '󰊪',
          niI = '󰊪',
          niR = '󰊪',
          niV = '󰊪',
          nt = '󰊪',
          ntT = '󰊪',
          v = '󰓠',
          vs = '󰓠',
          V = '󰓠',
          Vs = '󰓠',
          ['\22'] = '󰓠',
          ['\22s'] = '󰓠',
          s = '󰒅',
          S = '󰒅',
          ['\19'] = '󰒅',
          i = '',
          ic = '',
          ix = '',
          R = '',
          Rc = '',
          Rx = '',
          Rv = '',
          Rvc = '',
          Rvx = '',
          c = '󰘳',
          cv = '󰘳',
          ce = '󰘳',
          r = '',
          rm = '󰍻',
          ['r?'] = '',
          ['!'] = '',
          t = '',
        }
        return '▊ ' .. symbol[vim.api.nvim_get_mode().mode]
      end,
      color = function()
        local mode_color = {
          n = C.blue,
          no = C.blue,
          nov = C.blue,
          noV = C.blue,
          ['no\22'] = C.blue,
          niI = C.blue,
          niR = C.blue,
          niV = C.blue,
          nt = C.blue,
          ntT = C.blue,
          v = C.mauve,
          vs = C.mauve,
          V = C.mauve,
          Vs = C.mauve,
          ['\22'] = C.mauve,
          ['\22s'] = C.mauve,
          s = C.maroon,
          S = C.maroon,
          ['\19'] = C.maroon,
          i = C.green,
          ic = C.green,
          ix = C.green,
          R = C.red,
          Rc = C.red,
          Rx = C.red,
          Rv = C.red,
          Rvc = C.red,
          Rvx = C.red,
          c = C.peach,
          cv = C.peach,
          ce = C.peach,
          r = C.red,
          rm = C.teal,
          ['r?'] = C.sapphire,
          ['!'] = C.sky,
          t = C.lavender,
        }
        return {
          fg = mode_color[vim.fn.mode()],
        }
      end,
      padding = {
        left = 0,
        right = 1,
      },
    })

    insert_left({
      'filename',
      cond = conditions.buffer_not_empty,
      color = {
        fg = C.sapphire,
      },
    })

    insert_left({
      'location',
    })

    insert_left({
      'progress',
    })

    insert_left({
      'diagnostics',
      sources = {
        'nvim_diagnostic',
      },
      symbols = {
        error = ' ',
        warn = ' ',
        info = ' ',
      },
      diagnostics_color = {
        color_error = {
          fg = C.red,
        },
        color_warn = {
          fg = C.yellow,
        },
        color_info = {
          fg = C.blue,
        },
      },
    })

    insert_left({
      function()
        return '%='
      end,
    })

    insert_left({
      function()
        -- Based on https://github.com/dgox16/dotfiles/blob/909da9303444d16dcd94ee6eafa3b1428812b0e0/.config/nvim/lua/plugins/lualine.lua#L123
        local buf_clients = vim.lsp.get_clients()
        local buf_ft = vim.bo.filetype
        if next(buf_clients) == nil then
          return 'No Active LSP'
        end
        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            table.insert(buf_client_names, client.name)
          end
        end

        local lint_s, lint = pcall(require, 'lint')
        if lint_s then
          for ft_k, ft_v in pairs(lint.linters_by_ft) do
            if type(ft_v) == 'table' then
              for _, linter in ipairs(ft_v) do
                if buf_ft == ft_k then
                  table.insert(buf_client_names, linter)
                end
              end
            elseif type(ft_v) == 'string' then
              if buf_ft == ft_k then
                table.insert(buf_client_names, ft_v)
              end
            end
          end
        end

        local ok, conform = pcall(require, 'conform')
        local formatters = table.concat(conform.formatters_by_ft[vim.bo.filetype], ' ')
        if ok then
          for formatter in formatters:gmatch('%w+') do
            if formatter ~= 'format' then
              table.insert(buf_client_names, formatter)
            end
          end
        end

        local hash = {}
        local unique_client_names = {}

        for _, v in ipairs(buf_client_names) do
          if not hash[v] then
            unique_client_names[#unique_client_names + 1] = v
            hash[v] = true
          end
        end
        local language_servers = table.concat(unique_client_names, ', ')

        return language_servers
      end,
      icon = ' ',
      color = {
        fg = C.lavender,
      },
    })

    insert_right({
      'o:encoding',
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = {
        fg = C.green,
      },
    })

    insert_right({
      'filetype',
      colored = true,
      icon_only = false,
    })

    insert_right({
      'fileformat',
      fmt = string.upper,
      icons_enabled = true,
      symbols = {
        unix = '󰻀',
        mac = '',
        dos = '',
      },
      color = {
        fg = C.green,
      },
    })

    insert_right({
      'branch',
      icon = '󰘵',
      color = {
        fg = C.mauve,
      },
    })

    insert_right({
      'diff',
      symbols = {
        added = ' ',
        modified = ' ',
        removed = ' ',
      },
      diff_color = {
        added = {
          fg = C.green,
        },
        modified = {
          fg = C.peach,
        },
        removed = {
          fg = C.red,
        },
      },
      cond = conditions.hide_in_width,
    })

    insert_right({
      function()
        return '▊'
      end,
      color = function()
        local mode_color = {
          n = C.blue,
          no = C.blue,
          nov = C.blue,
          noV = C.blue,
          ['no\22'] = C.blue,
          niI = C.blue,
          niR = C.blue,
          niV = C.blue,
          nt = C.blue,
          ntT = C.blue,
          v = C.mauve,
          vs = C.mauve,
          V = C.mauve,
          Vs = C.mauve,
          ['\22'] = C.mauve,
          ['\22s'] = C.mauve,
          s = C.maroon,
          S = C.maroon,
          ['\19'] = C.maroon,
          i = C.green,
          ic = C.green,
          ix = C.green,
          R = C.red,
          Rc = C.red,
          Rx = C.red,
          Rv = C.red,
          Rvc = C.red,
          Rvx = C.red,
          c = C.peach,
          cv = C.peach,
          ce = C.peach,
          r = C.red,
          rm = C.teal,
          ['r?'] = C.sapphire,
          ['!'] = C.sky,
          t = C.lavender,
        }
        return {
          fg = mode_color[vim.fn.mode()],
        }
      end,
      padding = {
        left = 1,
      },
    })
    return config
  end,
}
