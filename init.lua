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

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

local plugins = {
	"tpope/vim-sleuth",
	{ "numToStr/Comment.nvim", opts = {} },
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	require("plugins.lsp"),
	require("plugins.cmp"),
	"hrsh7th/vim-vsnip",
	"hrsh7th/vim-vsnip-integ",
	require("plugins.dap"),
	{ "mfussenegger/nvim-jdtls", dependencies = { "mfussenegger/nvim-dap" } },
	"MunifTanjim/nui.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-neo-tree/neo-tree.nvim",
	"Xuyuanp/nerdtree-git-plugin",
	"nvim-telescope/telescope-ui-select.nvim",
	require("plugins.treesitter"),
	require("plugins.lualine"),
	require("plugins.colorschemes"),
	require("plugins.tmux-navigator"),
	require("plugins.dadbod"),
	require("plugins.dotenv"),
	require("plugins.whichkeys"),
	require("plugins.copilot"),
	require("plugins.remote"),
	require("plugins.conform"),
	require("plugins.mini"),
	{ "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" } },
}

local opts = {}
require("lazy").setup(plugins, opts)

vim.keymap.set("n", "<leader>ef", vim.diagnostic.open_float, { desc = "Diagnostic: [E]rror [F]loat" })
vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Diagnostic: [E]rror [Q]uickfix List" })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.g.mapleader = " "
require("config.telescope")
require("config.nerdtree")
require("config.dap")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.g.have_nerd_font = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.cursorline = true
vim.opt.inccommand = "split"
