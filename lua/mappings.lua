require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "\\", "<cmd>:vsplit <CR>")
map("n", "<leader>\\", "<cmd>:split <CR>")
-- map('n', "<leader>s", "<cmd>w<CR>")
