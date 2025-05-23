-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = false
vim.opt.shiftround = true
vim.opt.showmatch = true
-- bug: Setting `incsearch` to false makes characters not visible when searching with `/`.
vim.opt.incsearch = true

-- for Neovide
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
end
