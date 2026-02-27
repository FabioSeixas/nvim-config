-- require("mason").setup()
-- require("mason-nvim-dap").setup({
--   handlers = {},
--   ensure_installed = { "js" },
-- })

-- local js_debug_adapter = vim.fn.exepath "js-debug-adapter"

local dap = require('dap')

dap.set_log_level('TRACE')

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "/home/fabioseixas/.local/share/nvim/vscode-js-debug", -- Path to vscode-js-debug installation.
  debugger_path = "/home/fabioseixas/.local/share/nvim/lazy/nvim-dap-vscode-js", -- Path to vscode-js-debug installation.
  -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

-- dap.adapters['pwa-node'] = {
--   -- type = "executable",
--   -- command = js_debug_adapter
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "node",
--     -- 💀 Make sure to update this path to point to your installation
--     args = {"/home/fabioseixas/.local/share/nvim/vscode-js-debug/out/src/vsDebugServer.js", "${port}"},
--   }
-- }

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  -- {
  --   type = "pwa-node",
  --   request = "attach",
  --   name = "Attach",
  --   processId = require'dap.utils'.pick_process,
  --   cwd = "${workspaceFolder}",
  -- }
}

-- for _, language in ipairs({ "typescript", "javascript" }) do
--   require("dap").configurations[language] = {
--     ... -- see below
--   }
-- end
