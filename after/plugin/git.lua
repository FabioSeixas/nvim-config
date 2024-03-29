require('gitsigns').setup()

vim.keymap.set("n", "<leader>gs", ':Gitsigns stage_hunk<CR>')
vim.keymap.set("n", "<leader>go", ':Telescope git_status<CR>')
vim.keymap.set("n", "<leader>gS", ':Gitsigns stage_buffer<CR>')
vim.keymap.set("n", "<leader>gr", ':Gitsigns reset_hunk<CR>')
vim.keymap.set("n", "<leader>gR", ':Gitsigns reset_buffer<CR>')
vim.keymap.set("n", "<leader>gk", ':Gitsigns prev_hunk<CR>')
vim.keymap.set("n", "<leader>gj", ':Gitsigns next_hunk<CR>')
vim.keymap.set("n", "<leader>gd", ':Gitsigns diffthis<CR>')
vim.keymap.set("n", "<leader>gl", ':Gitsigns blame_line<CR>')
