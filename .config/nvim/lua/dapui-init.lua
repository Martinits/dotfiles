-------- DAP-UI -------

local dapui = require("dapui")

dapui.setup{
    icons = { expanded = "", collapsed = "", current_frame = "" }
}

-- auto open / close using dap listener
local dap = require('dap')
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- evaluate expression
vim.keymap.set('n', '<M-v>', [[:lua require("dapui").eval('')<LEFT><LEFT>]], { desc = "dapui: eval" })
