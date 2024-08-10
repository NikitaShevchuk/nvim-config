local dap = require("dap")

-- set console for pure typescript program (e.g. cli program).
dap.defaults.fallback.external_terminal = {
  command = "/usr/bin/alacritty",
  args = { "-e" },
}
dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.defaults.fallback.focus_terminal = true
dap.set_log_level("INFO")

-- depending on your installation location.
local debugger_location = os.getenv("HOME") .. "/Software/vscode-node-debug2"

dap.adapters.node = {
  type = "executable",
  command = "node",
  args = { debugger_location .. "/out/src/nodeDebug.js" },
}

dap.configurations.typescript = {
  {
    name = "Lanunch Node",
    type = "node",
    request = "launch",
    runtimeArgs = { "-r", "ts-node/register" },
    runtimeExecutable = "node",
    args = { "--inspect", "${file}" },
    skipFiles = { "node_modules/**" },
    console = "integratedTerminal",
  },
}
