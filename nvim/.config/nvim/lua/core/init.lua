---@diagnostic disable: empty-block, unbalanced-assignments
local oks = {
  ['Lazy'] = pcall(require, 'core.lazy'),
  -- ['Mason Path'] = pcall(require, 'core.mason_path'),
  -- ['LSP'] = pcall(require, 'core.lsp'),
}

for _, item in pairs(oks) do
  local ok, _ = item
  if not ok then
  end
end
