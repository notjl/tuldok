local ok, configs = pcall(require, 'nvim-treesitter.configs')
local install_ok, installer = pcall(require, 'nvim-treesitter.install')
if not ok and not install_ok then
    return
end

require 'nvim-treesitter.install'.compilers = {"gcc"}
configs.setup{
    ensure_installed = 'maintained',
    sync_install = false,
    ignore_install = {""},
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = false,
        disable = {"yaml"},
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    },
}
