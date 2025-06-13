require("dapui").setup()

local dap = require('dap')
dap.adapters.lldb = {
      type = 'executable',
      -- command = 'C:/Program Files/LLVM/bin/lldb-vscode.exe', -- adjust as needed, must be absolute path
      command = 'C:/Users/yongnianliu/.vscode/extensions/vadimcn.vscode-lldb-1.11.0/adapter/codelldb.exe', -- adjust as needed, must be absolute path
      name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/windows/x64/debug/hello.exe', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp