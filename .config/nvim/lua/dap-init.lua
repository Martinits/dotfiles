-------- NVIM-DAP -------

local dap = require('dap')
local keymap = vim.keymap.set

-- keymaps
keymap("n", "tb", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { desc = "dap: toggle breakpoint"})
keymap("n", "tB", "<CMD>lua require'dap'.set_breakpoint(vim.fn.input '[Condition]> ')<CR>", { desc = "dap: set conditional breakpoint"})
keymap("n", "<F4>", "<CMD>lua require'dap'.terminate()<CR>", { desc = "dap: terminate"})
keymap("n", "<F5>", "<CMD>lua require'dap'.continue()<CR>", { desc = "dap: continue"})
keymap("n", "<F6>", "<CMD>lua require'dap'.step_over()<CR>", { desc = "dap: step over"})
keymap("n", "<F7>", "<CMD>lua require'dap'.step_into()<CR>", { desc = "dap: step into"})
keymap("n", "<F8>", "<CMD>lua require'dap'.step_out()<CR>", { desc = "dap: step out"})
keymap("n", "<F9>", "<CMD>lua require'dap'.run_last()<CR>", { desc = "dap: run last"})

-- signs
vim.fn.sign_define("DapBreakpoint", {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define("DapBreakpointCondition", {text='⭕️', texthl='', linehl='', numhl=''})
vim.fn.sign_define("DapLogPoint", {text='📝', texthl='', linehl='', numhl=''})
vim.fn.sign_define("DapStopped", {text='👉', texthl='', linehl='', numhl=''})
vim.fn.sign_define("DapBreakpointRejected", {text='🚫', texthl='', linehl='', numhl=''})

-- adapters
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
}

dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python';
    args = { '-m', 'debugpy.adapter' };
}

-- configurations
local executable_prompt = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
end

dap.configurations.c = {
    {
        name = 'lldb-c',
        type = 'lldb',
        request = 'launch',
        program = executable_prompt,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    },
}

dap.configurations.cpp = {
    {
        name = 'lldb-cpp',
        type = 'lldb',
        request = 'launch',
        program = executable_prompt,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    },
}

dap.configurations.rust = {
    {
        name = 'lldb-rust',
        type = 'lldb',
        request = 'launch',
        program = executable_prompt,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
    },
}

dap.configurations.python = {
    {
        name = "debugpy";
        type = 'python';
        request = 'launch';
        program = "${file}";
        stopOnEntry = true,
        pythonPath = function()
            return '/usr/bin/python'
        end;
    },
}
