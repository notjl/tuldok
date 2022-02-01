local fn = vim.fn
local au = require "configs.utils"

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

local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
    print "Packer ❌"
    return
end

packer.init{
    -- Move to lua directory so impatient.nvim can cache it
    compile_path = fn.stdpath('config')..('/lua/packer_compiled.lua'),
    
    display = {
        open_fn= function()
            return require('packer.util').float {border = 'rounded'}
        end,
    },
}

return packer.startup(function(use)

    -- Based plugins
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/impatient.nvim'

    -- Theme
    use 'folke/tokyonight.nvim'
    use 'marko-cerovac/material.nvim'
    -- use 'LunarVim/onedarker.nvim'
    -- use 'Shatur/neovim-ayu'

    -- Discord Rich Presence
    use 'andweeb/presence.nvim'

    -- Notify errors in initialization to lessen startuptime
    use 'rcarriga/nvim-notify'

    if BOOTSTRAPPER then
        require('packer').sync()
    end
end)