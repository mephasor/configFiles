local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
"ellisonleao/gruvbox.nvim",
"nvim-tree/nvim-tree.lua",
"nvim-tree/nvim-web-devicons",
"nvim-lualine/lualine.nvim",
"nvim-treesitter/nvim-treesitter",
"Mofiqul/dracula.nvim",
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
}


local opts = {}

require("lazy").setup(plugins, opts)
