local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope [F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope [F]ind [G]rep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope [F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope [F]ind [H]elp" })
vim.keymap.set("n", "<leader>fc", telescope.git_commits, { desc = "Telescope [F]ind [C]ommits" })
vim.keymap.set("n", "<leader>fs", telescope.git_status, { desc = "Telescope [F]ind Git [S]tatus" })

require("telescope").load_extension("ui-select")
