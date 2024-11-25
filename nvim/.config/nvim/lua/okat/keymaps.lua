local opts = { noremap = true, silent = true}
local map = vim.keymap.set

map('', '<SPACE>', '<NOP>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Create Table for Keybindings
-- [MODE] {LHS} {RHS} <OPTIONS>
local keybindings = {
  -- [NORMAL] --
  ['n'] = {
    
    -- Replace "All" Shortcut --
    ['<S-s>']       =   '<CMD>%s//g<LEFT><LEFT>',
    
    -- Remap Saving --
    ['<LEADER>w']   =   '<CMD>w<CR>',

    -- Remap Quit --
    ['<LEADER>q']   =   '<CMD>q<CR>',	    -- Quit single buffer
    ['<LEADER>Qa']  =   '<CMD>qa<CR>',	    -- Quit all buffers

    -- Do Not Yank with "x" --
    ['x']           =   '"_x',

    -- Increment / Decrement Value Pointed Value --
    ['+']           =   '<C-a>',
    ['-']           =   '<C-x>',

    -- Delete a Word Backwards --
    -- ['dw']          =   'vb"_d',


    -- SPLITS --

    -- Split Navigation --
    ['<C-h>']       =   '<C-w>h',
    ['<C-j>']       =   '<C-w>j',
    ['<C-k>']       =   '<C-w>k',
    ['<C-l>']       =   '<C-w>l',

    -- Split Creation --
    ['<LEADER>sv']  =   '<CMD>vsplit<CR><C-w>w',
    ['<LEADER>ss']  =   '<CMD>split<CR><C-w>w',

    -- Resize Splits --
    ['<C-S-Up>']    =   '<C-w>+',
    ['<C-S-Down>']  =   '<C-w>-',
    ['<C-S-Left>']  =   '<C-w><',
    ['<C-S-Right>'] =   '<C-w>>',

    -- Buffer Navigation --
    ['<S-l>']       =   '<CMD>bn<CR>',
    ['<S-h>']       =   '<CMD>bp<CR>',


  },

  -- [INSERT] --
  ['i'] = {
    
    -- Exit Insert Mode --
    ['jj']          =   '<ESC>',

  },

  -- [VISUAL] --
  ['v'] = {

    -- Stay in Visual Mode while Indenting --
    ['<']           =   '<gv',
    ['>']           =   '>gv',

    -- Move Text Up and Down --
    ['<C-A-k>']       =   '<CMD>m .-2<CR>==',     -- Move Text Down
    ['<C-A-j>']       =   '<CMD>m .+1<CR>==',     -- Move Text Up

  },
 
  -- [VISUAL BLOCK] --
  ['x'] = {

    -- Move Text Up and Down --
    ['<C-A-k>']       =   "<CMD>m '<-3<CR>gv-gv",     -- Move Text Down
    ['<C-A-j>']       =   "<CMD>m '>+1<CR>gv-gv",     -- Move Text Up

  },

}

-- Iterate Through the Keybindings
for mode, keybinds in pairs(keybindings) do
  for lhs, rhs in pairs(keybinds) do
    map(mode, lhs, rhs, opts)
  end
end
