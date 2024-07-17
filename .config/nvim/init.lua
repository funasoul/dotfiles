-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = false
vim.opt.wrapscan = false
vim.opt.shiftround = true
vim.opt.showmatch = true

-- Insert timestamp after "Last Modified: Wed, 17 Jul 2024 17:48:56 +0900
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
