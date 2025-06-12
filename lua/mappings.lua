require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Ctrl+P
map("n", "<C-P>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- Ctrl+Shift+O
map("n", "<C-S-O>", "<cmd>Telescope lsp_document_symbols<cr><Left><Del>", { desc = "telescope symbols" })

map("n", "<leader>lo", "<cmd>SymbolsOutline<CR>", { desc = "Symbols Outline" })