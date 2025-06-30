-- Declare table for protective calls (safe import) and for atomicity
local oks = {
  ['VIM Options'] = pcall(require, 'config.options'),
  ['VIM Keymap'] = pcall(require, 'config.keymaps'),
  ['VIM AutoCMD'] = pcall(require, 'config.autocmd'),
  ['Plugins'] = pcall(require, 'config.plugin_manager')
}

-- Iterate through table and if status is not ok, skip
for name, item in pairs(oks) do
  local ok, _ = item
  if not ok then
  end
end
