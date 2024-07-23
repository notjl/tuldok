-- Declare table for protective calls (safe import) and for atomicity
local oks = {
  ['VIM Options'] = pcall(require, 'okat.options'),
  ['VIM Keymap'] = pcall(require, 'okat.keymaps'),
  ['VIM AutoCMD'] = pcall(require, 'okat.autocmd'),
  ['Plugins'] = pcall(require, 'okat.plugin_manager')
}

-- Iterate through table and if status is not ok, skip
for name, item in pairs(oks) do
  local ok, _ = item
  if not ok then
  end
end
