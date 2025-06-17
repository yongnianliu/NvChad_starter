require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Ctrl+P
-- map("n", "<C-P>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- Ctrl+Shift+O
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "telescope find symbols" })

map("n", "<leader>lo", "<cmd>SymbolsOutline<CR>", { desc = "Symbols Outline" })

map("n", "<leader>fp", 
	function()
		require'telescope'.extensions.projects.projects{}
	end, { desc = "telescope projects" })

-- 调试
map('n', '<F5>', function() require('dapui').open(); require('dap').continue() end, { desc = "dap start" })
map('n', '<S-F5>', function() require('dapui').close(); require('dap').close() end, { desc = "dap stop" })
map('n', '<F10>', function() require('dap').step_over() end, { desc = "dap step over" })
map('n', '<F11>', function() require('dap').step_into() end, { desc = "dap step into" })
map('n', '<S-F11>', function() require('dap').step_out() end, { desc = "dap step out" })
map('n', '<F9>', function() require('dap').toggle_breakpoint() end, { desc = "dap toggle breakpoint" })
map('n', '<S-F9>', function() require('dap').toggle_breakpoint() end, { desc = "dap clear breakpoints" })
map('n', '<leader>dh', "<cmd>lua require('dap.ui.widgets').hover()<cr>", { desc = "dap hover" })
map('n', '<leader>df', "<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.frames)<cr>", { desc = "dap frames" })
-- map('n', '<leader>dt', "<cmd>PBToggleBreakpoint<cr>", { desc = "dap toggle breakpoint" })
--map('n', '<leader>dC', "<cmd>PBClearAllBreakpoints<cr>", { desc = "dap toggle breakpoint" })