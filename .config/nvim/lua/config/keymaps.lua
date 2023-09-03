-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Do not jump on invocation of *
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<Cr>")

-- <C-n>, <C-p> will jump to next/previous error
vim.keymap.set("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next{wrap = false}<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev{wrap = false}<cr>")
