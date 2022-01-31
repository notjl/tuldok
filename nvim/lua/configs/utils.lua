local M = {}
local cmd = vim.api.nvim_command

function M.group(definitions)
    for name, definition in pairs(definitions) do
        cmd('augroup '..name)
        cmd('autocmd!')
        for _, def in ipairs(definition) do
            cmd(table.concat(vim.tbl_flatten{'autocmd', def}, ' '))
        end
        cmd('augroup END')
    end
end

return M
