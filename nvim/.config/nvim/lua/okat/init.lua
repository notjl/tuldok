-- Declare table for pcalls (safe import) and for atomicity
local oks = {
    ["VIM Options"] = pcall(require, "okat.options"),
    ["VIM Keymap"] = pcall(require, "okat.keymaps"),
    ["VIM Autocmd"] = pcall(require, "okat.autocmd"),
    ["Plugins"] = pcall(require, "okat.plugin_manager"),
}


-- Iterate through tables and if status is not ok, notify user
for name, item in pairs(oks) do
    local ok, _ = item
    if not ok then end
end
