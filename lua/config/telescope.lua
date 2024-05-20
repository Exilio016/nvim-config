local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fc', telescope.git_commits, {})
vim.keymap.set('n', '<leader>fs', telescope.git_status, {})
vim.keymap.set('n', '<leader>fl', telescope.lsp_dynamic_workspace_symbols, {})

require('telescope').load_extension('ui-select')
