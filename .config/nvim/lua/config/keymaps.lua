-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Do not jump on invocation of *
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<Cr>")
