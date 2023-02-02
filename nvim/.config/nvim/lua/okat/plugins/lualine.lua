-- Inspired by Evline config by shadmansaleh @ https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine
-- Guided by catppuccin lualine config @ https://github.com/catppuccin/nvim/blob/main/lua/lualine/themes/catppuccin.lua
-- and also by https://github.com/nvim-lualine/lualine.nvim/blob/e37d5d325da9c472c73d97bd0210c480c5d9babc/lua/lualine/utils/mode.lua
-- for every mode available in vim.
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        local C = require("catppuccin.palettes").get_palette("mocha")
        local O = require("catppuccin").options

        local transparent_bg = O.transparent_background and "NONE" or C.mantle

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,

            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,

            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local config = {
            options = {
                disabled_filetypes = {
                    "alpha",
                    "dashboard",
                    "neo-tree",
                },
                component_separators = "",
                section_separators = "",
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

        insert_left {
            function()
                local symbol = {
                    n = "󰊪",
                    no = "󰊪",
                    nov = "󰊪",
                    noV = "󰊪",
                    ["no\22"] = "󰊪",
                    niI = "󰊪",
                    niR = "󰊪",
                    niV = "󰊪",
                    nt = "󰊪",
                    ntT = "󰊪",
                    v = "󰓠",
                    vs = "󰓠",
                    V = "󰓠",
                    Vs = "󰓠",
                    ["\22"] = "󰓠",
                    ["\22s"] = "󰓠",
                    s = "󰒅",
                    S = "󰒅",
                    ["\19"] = "󰒅",
                    i = "",
                    ic = "",
                    ix = "",
                    R = "",
                    Rc = "",
                    Rx = "",
                    Rv = "",
                    Rvc = "",
                    Rvx = "",
                    c = "󰘳",
                    cv = "󰘳",
                    ce = "󰘳",
                    r = "",
                    rm = "󰍻",
                    ["r?"] = "",
                    ["!"] = "",
                    t = "",
                }
                return "▊ " .. symbol[vim.api.nvim_get_mode().mode]
            end,
            color = function()
                local mode_color = {
                    n = C.blue,
                    no = C.blue,
                    nov = C.blue,
                    noV = C.blue,
                    ["no\22"] = C.blue,
                    niI = C.blue,
                    niR = C.blue,
                    niV = C.blue,
                    nt = C.blue,
                    ntT = C.blue,
                    v = C.mauve,
                    vs = C.mauve,
                    V = C.mauve,
                    Vs = C.mauve,
                    ["\22"] = C.mauve,
                    ["\22s"] = C.mauve,
                    s = C.maroon,
                    S = C.maroon,
                    ["\19"] = C.maroon,
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
                    ["r?"] = C.sapphire,
                    ["!"] = C.sky,
                    t = C.lavender,
                }
            return {
                fg = mode_color[vim.fn.mode()],
            }
            end,
            padding = {
                left = 0,
                right = 1,
            }
        }

        insert_left {
            "filename",
            cond = conditions.buffer_not_empty,
            color = {
                fg = C.sapphire,
            }
        }

        insert_left {
            "location"
        }

        insert_left {
            "progress"
        }

        insert_left {
            "diagnostics",
            sources = {
                "nvim_diagnostic",
            },
            symbols = {
                error = " ",
                warn = " ",
                info = " ",
            },
            diagnostics_color = {
                color_error = {
                    fg = C.red,
                },
                color_warn = {
                    fg = C.yellow,
                },
                color_info = {
                    fg = C.blue
                },
            }
        }

        insert_left {
            function()
                return "%="
            end
        }

        insert_left {
            function()
                local message = "No Active LSP"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()

                if next(clients) == nil then
                    return message
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return message
            end,
            icon = " ",
            color = {
                fg = C.lavender,
            }
        }

        insert_right {
            "o:encoding",
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = {
                fg = C.green,
            }
        }

        insert_right {
            "filetype",
            colored = true,
            icon_only = false
        }

        insert_right {
            "fileformat",
            fmt = string.upper,
            icons_enabled = true,
            symbols = {
                unix = "󰻀",
                mac = "",
                dos = "",
            },
            color = {
                fg = C.green,
            }
        }

        insert_right {
            "branch",
            icon = "󰘵",
            color = {
                fg = C.mauve,
            }
        }

        insert_right {
            "diff",
            symbols = {
                added = " ",
                modified = "柳",
                removed = " ",
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
            cond = conditions.hide_in_width
        }

        insert_right {
            function()
                return "▊"
            end,
            color = function()
                local mode_color = {
                    n = C.blue,
                    no = C.blue,
                    nov = C.blue,
                    noV = C.blue,
                    ["no\22"] = C.blue,
                    niI = C.blue,
                    niR = C.blue,
                    niV = C.blue,
                    nt = C.blue,
                    ntT = C.blue,
                    v = C.mauve,
                    vs = C.mauve,
                    V = C.mauve,
                    Vs = C.mauve,
                    ["\22"] = C.mauve,
                    ["\22s"] = C.mauve,
                    s = C.maroon,
                    S = C.maroon,
                    ["\19"] = C.maroon,
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
                    ["r?"] = C.sapphire,
                    ["!"] = C.sky,
                    t = C.lavender,
                }
            return {
                fg = mode_color[vim.fn.mode()],
            }
            end,
            padding = {
                left = 1
            }
        }
        return config
    end
}
