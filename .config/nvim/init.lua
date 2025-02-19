require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
require 'plugins.neotree',
require 'plugins.colortheme',
require 'plugins.lazygit',
require 'plugins.bufferline',
require 'plugins.lualine',
require 'plugins.treesitter',
require 'plugins.telescope',
require 'plugins.render-markdown',
require 'plugins.markdown-preview',
require 'plugins.alpha',
})

vim.cmd.colorscheme "catppuccin"

