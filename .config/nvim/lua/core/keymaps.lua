-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v'}, '<Space>', '<Nop>', { silent  = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

local opts = { noremap = true, silent = true }

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Save no format
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Delete one character without copying
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'n', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts)
