return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            spelling = true,
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- NORMAL MODE --
        wk.register({
            ["<LEADER>"] = {
                f = {
                    name = "+File",
                    f = {"<CMD> Telescope find_files<CR>", "Find File"}
                },

                w = {"<CMD>w<CR>", "Write File"},

                Q = {
                    name = "+Quit",
                    a = {"<CMD>qa<CR>", "Quit All"}
                },

                -- Gitsigns.nvim --
                h = {
                    name = "+Gitsigns Actions",
                    s = {"<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk"},
                    r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
                    S = {"<CMD>Gitsigns stage_buffer<CR>", "Stage Buffer"},
                    u = {"<CMD>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
                    R = {"<CMD>Gitsigns reset_buffer<CR>", "Reset Buffer"},
                    p = {"<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk"},
                    b = {"<CMD>lua require'gitsigns'.blame_line{full=true}<CMD>", "Blame Line"},
                    d = {"<CMD>Gitsigns diffthis<CR>", "Diff This"},
                    D = {"<CMD>lua require'gitsigns'.diffthis('~')<CR>", "Diff This (~)"},
                },
                t = {
                    name = "+Gitsigns Toggle Actions",
                    b = {"<CMD>Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame"},
                    d = {"<CMD>Gitsigns toggle_deleted<CR>", "Toggle Deleted"},
                },

                -- LSP --
                d = {"<CMD>lua vim.diagnostic.setloclist()<CR>", "LSP Set Loc List (Diagnostic)"},

                -- Neotree --
                e = {
                    name = "+Neotree",
                    e = {"<CMD>Neotree toggle<CR>", "Toggle Neotree"},
                },
            },

            g = {
                -- Comment.nvim --
                c = {
                    name = "+Line Comment",
                    c = {"Line Comment Toggle"},
                    ["0"] = {"Line Comment Above"},
                    o = {"Line Comment Below"},
                    A = {"Comment End of the Line"},
                },

                -- LSP --
                d = {"<CMD>lua vim.lsp.buf.definition()<CR>", "LSP Definition"},
                D = {"<CMD>lua vim.lsp.buf.declaration()<CR>", "LSP Definition"},
                i = {"<CMD>lua vim.lsp.buf.implementation()<CR>", "LSP Implementation"},
                r = {"<CMD>lua vim.lsp.buf.references()<CR>", "LSP References"},
                l = {"<CMD>lua vim.diagnostic.open_float()<CR>", "LSP Open Float (Diagnostic)"},
            },

            -- Surround --
            s = {
                name = "+Surround",
                a = {"Add"},
                d = {"Delete"},
                f = {"Find"},
                F = {"Find Left"},
                h = {"Highlight"},
                r = {"Replace"},
                n = {"Update <N> Lines"},
            },

            ["]"] = {
                -- Gitsigns.nvim -- 
                c = {"&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", "Next Hunk"},

                -- LSP -- 
                d = {"<CMD> lua vim.diagnostic.goto_next({ border = 'rounded'})<CR>", "LSP Go To Next"},
            },
            ["["] = {
                -- Gitsigns.nvim -- 
                c = {"&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", "Previous Hunk"},

                -- LSP --
                d = {"<CMD> lua vim.diagnostic.goto_prev({ border = 'rounded'})<CR>", "LSP Go To Previous"},
            },
        }, {mode = "n"})

        -- VISUAL MODE -- 
        wk.register({
            g = {
                name = "+Comment",
                c = {"Line Comment"},
                b = {"Block Comment"}
            },
            ["<LEADER>"] = {
                h = {
                    name = "+Gitsigns Actions",
                    s = {"<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk"},
                    r = {"<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk"},
                }
            }
        }, {mode = "v"})
    end
}
