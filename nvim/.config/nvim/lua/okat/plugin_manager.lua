local fn = vim.fn
local cmd = vim.api.nvim_command

-- Boostrap lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- check if lazy is properly installed
local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then
    return
end

-- return lazy setup going to init
return lazy.setup("okat.plugins")
