return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "java" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			ignore_install = {},
			auto_install = true,
			modules = {
				-- Treesitter playground
				"playground",
				-- Treesitter text objects
				"textobjects",
				-- Treesitter incremental selection
				"incremental_selection",
				-- Treesitter refactor
				"refactor",
				-- Treesitter context
				"context_commentstring",
			},
		})
	end,
}
