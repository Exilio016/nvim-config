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

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

local plugins = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    require('plugins.dap'),
    { 'mfussenegger/nvim-jdtls',         dependencies = { 'mfussenegger/nvim-dap' } },
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-neo-tree/neo-tree.nvim',
    'Xuyuanp/nerdtree-git-plugin',
    'nvim-telescope/telescope-ui-select.nvim',
    require('plugins.lualine'),
    require('plugins.colorschemes'),
    require('plugins.tmux-navigator'),
    require('plugins.dadbod'),
    require('plugins.dotenv'),
    require('plugins.whichkeys'),
    require('plugins.copilot'),
    { 'ckipp01/nvim-jenkinsfile-linter', dependencies = { "nvim-lua/plenary.nvim" } },
}

local opts = {}
require("lazy").setup(plugins, opts)

vim.g.mapleader = ' '
require('config.telescope')
require('config.lsp')
require('config.nerdtree')
require('config.dap')
require('config.types')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
