local ok, null = pcall(require, 'null-ls')
if not ok then
    return
end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

null.setup({
    debug = false,
    sources = {
        formatting.autopep8,
        diagnostics.pylint,
    },
})
