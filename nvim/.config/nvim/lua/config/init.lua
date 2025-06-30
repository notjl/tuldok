---@diagnostic disable: unbalanced-assignments, empty-block
-- Declare table for protective calls (safe import) and for atomicity
local oks = {
  ['VIM Options'] = pcall(require, 'config.options'),
  ['VIM Keymap'] = pcall(require, 'config.keymaps'),
  ['VIM AutoCMD'] = pcall(require, 'config.autocmd'),
}

-- Iterate through table and if status is not ok, skip
for _, item in pairs(oks) do
  local ok, _ = item
  if not ok then
  end
end
