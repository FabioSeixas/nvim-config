require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
})

local builtin = require('telescope.builtin')

-- local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>bf", ':Telescope buffers<CR>')
vim.keymap.set("n", "<leader>c", ':bdelete<CR>')
vim.keymap.set('n', '<leader>st', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>lj', "<cmd>lua vim.diagnostic.goto_next({ float = { source = true }})<cr>", {})
vim.keymap.set('n', '<leader>lk', "<cmd>lua vim.diagnostic.goto_prev({ float = { source = true }})<cr>", {})

require('telescope').load_extension('fzf')
