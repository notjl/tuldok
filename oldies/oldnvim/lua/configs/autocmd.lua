local cmd = vim.api.nvim_command
local au = require('configs.utils')

au.group(
    {
        numbertoggle = {
            {'BufEnter,FocusGained,InsertLeave,WinEnter', '* if &nu && mode() != \"i\"', '| set rnu | endif'},
            {'BufLeave,FocusLost,InsertEnter,WinLeave', '* if &nu', '| set nornu | endif'}
        };
        src_colo_w = {
            {'BufWritePost', 'colorscheme.lua source <afile>'},
        };
        packer_user_config = {
            {'BufWritePost', 'plugins.lua source <afile>', '| PackerSync'},
        };
    }
)

