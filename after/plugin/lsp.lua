-- lsp.set_sign_icons({
-- 	error = '✘',
-- 	warn = '▲',
-- 	hint = '⚑',
-- 	info = '»'
-- })

-- leave it here just in case
-- https://github.com/LunarVim/LunarVim/blob/0b13c9f6bc12a59bde521862254fbcae87b58b34/lua/lvim/lsp/config.lua
-- local function show_line_diagnostics()
-- 	local config = vim.lsp.diagnostics.float
-- 	config.scope = "line"
-- 	vim.diagnostic.open_float(0, config)
-- end
--

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

	-- if client.name == 'tsserver' then
	-- 	client.server_capabilities.documentFormattingProvider = false
	-- end

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>lg", function() vim.diagnostic.open_float({ source = true }) end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
  end
})

-- lsp.format_mapping("<leader>lf", {
-- 	format_opts = {
-- 		async = false,
-- 		timeout_ms = 100000,
-- 	},
-- 	servers = {
-- 		['null-ls'] = { 'javascript', 'typescript' },
-- 	}
-- })


vim.diagnostic.config({
  virtual_text = false,
})

-- local null_ls = require('null-ls')

-- null_ls.setup({
-- 	sources = {
-- 		-- Replace these with the tools you have installed
-- 		null_ls.builtins.formatting.prettier,
-- 		-- null_ls.builtins.diagnostics.eslint,
-- 		-- null_ls.builtins.formatting.stylua,
-- 	},
-- 	-- on_attach = function(client, bufnr)
-- 	--   if client.supports_method("textDocument/formatting") then
-- 	--     vim.keymap.set("n", "<Leader>lf", function()
-- 	--       vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
-- 	--     end, { buffer = bufnr, desc = "[lsp] format" })
-- 	--
-- 	--     -- format on save
-- 	--     vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
-- 	--     vim.api.nvim_create_autocmd(event, {
-- 	--       buffer = bufnr,
-- 	--       group = group,
-- 	--       callback = function()
-- 	--         vim.lsp.buf.format({ bufnr = bufnr, async = async })
-- 	--       end,
-- 	--       desc = "[lsp] format on save",
-- 	--     })
-- 	--   end
-- 	--
-- 	--   if client.supports_method("textDocument/rangeFormatting") then
-- 	--     vim.keymap.set("x", "<Leader>lf", function()
-- 	--       vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
-- 	--     end, { buffer = bufnr, desc = "[lsp] format" })
-- 	--   end
-- 	-- end,
-- })

local prettier = require("prettier")

prettier.setup({
	bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
