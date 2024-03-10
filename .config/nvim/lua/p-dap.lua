-- local python_path = os.getenv("PYTHON_PATH")
local python_path = 'C:\\Python311\\python.exe'
local dap, dapui = require('dap'), require('dapui')

dapui.setup()
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
            return python_path
        end,
    },
}

dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = python_path,
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

local keymap = vim.keymap

keymap.set('n', '<F5>', function() dap.continue() end)
keymap.set('n', '<F6>', function() dap.step_over() end)
keymap.set('n', '<F7>', function() dap.step_into() end)
keymap.set('n', '<F8>', function() dap.step_out() end)
keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
keymap.set('n', '<Leader>dk', function() dap.close() dapui.close() end)

keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end
