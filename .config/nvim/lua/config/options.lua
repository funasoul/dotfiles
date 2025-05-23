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
  -- Font
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
  -- Opacity
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  -- Animated cursor
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
