local fn = vim.fn
local au = require "configs.utils"
local cmd = vim.api.nvim_command

-- automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path))> 0 then
    BOOTSTRAPPER = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print "Installing packer close and reopen NeoVim..."
    cmd('packadd packer.nvim')
end

au.group(
    {
        packer_user_config = {
            {'BufWritePost', 'plugins.lua source <afile>', '| PackerSync'},
        };
    }
)

local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
    print "Packer ❌"
    return
end

packer.init{
    display = {
        open_fn= function()
            return require('packer.util').float {border = 'rounded'}
        end,
    },
}

return packer.startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'LunarVim/onedarker.nvim'
    use 'Shatur/neovim-ayu'

    if BOOTSTRAPPER then
        require('packer').sync()
    end
end)
