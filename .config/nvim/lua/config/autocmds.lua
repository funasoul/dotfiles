-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Insert timestamp after "Last Modified: Fri, 25 Apr 2025 01:21:41 +0900
local function LastModified()
  if vim.bo.modified then
    local save_cursor = vim.fn.getpos(".")
    local n = math.min(200, vim.fn.line("$"))
    local pattern = [[\%(.\{,10}Last [Mm]odified: \)\zs.*]]
    local replacement = os.date("%a, %d %b %Y %H:%M:%S %z")

    vim.cmd(string.format("keepjumps silent! 1,%ds#%s#%s#e", n, pattern, replacement))
    vim.fn.histdel("search", -1)
    vim.fn.setpos(".", save_cursor)
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = LastModified,
})

if vim.env.NVIM_AUTO_PICKER == "config" then
  vim.schedule(function()
    require("lazyvim.util.pick").config_files()()
  end)
end
