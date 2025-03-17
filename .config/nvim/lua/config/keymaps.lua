-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Imported my old keymaps
vim.keymap.set("n", "P", '"zp')
vim.keymap.set("n", "-1", '"1p')
vim.keymap.set("n", "-2", '"2p')
vim.keymap.set("n", "-3", '"3p')
vim.keymap.set("n", "-4", '"4p')
vim.keymap.set("n", "--", "mz\"zy'k`z")
vim.keymap.set("n", "-=", "mz\"zd'k`z")
vim.keymap.set("n", "-y", '"zy`k')
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
-- vim.keymap.set("c", "<C-d>", "<Del>") -- disabled for completion in ex mode.

-- Do not jump on invocation of *
vim.keymap.set("n", "*", "<cmd>keepjumps normal! mi*`i<cr>")

-- do not inject to system clipboard on "c"
vim.keymap.set("n", "c", '<cmd>set clipboard=""<cr>c')
vim.keymap.set("n", "C", '<cmd>set clipboard=""<cr>C')

-- Clear search and reset clipboard to unnamedplus with <esc>
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><cmd>set clipboard=unnamedplus<cr><esc>",
  { desc = "Escape and clear hlsearch" }
)

-- don't change the cursor position on "J"
vim.keymap.set("n", "J", "mzJ`z")

-- <C-n>, <C-p> will jump to next/previous error
vim.keymap.set("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next{wrap = false}<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev{wrap = false}<cr>")

-- Move Lines
if vim.fn.has("macunix") then
  vim.keymap.set("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
  vim.keymap.set("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
  vim.keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  vim.keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })
end

-- Compile & execute code
vim.keymap.set("n", "<leader>r", ":lua RunCode()<CR>", { desc = "Run Code" })

-- Starter
vim.keymap.del("n", "<leader>us") -- remove "Enable Spelling"
vim.keymap.set("n", "<leader>us", ":lua Snacks.dashboard()<CR>", { desc = "Open mini starter" })
