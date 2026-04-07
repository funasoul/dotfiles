-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- load my custom functions
require("custom.functions")

-- disable showing [Process exited 0] under my pokemon (works on nvim >= 0.12.0)
vim.api.nvim_clear_autocmds({ group = "nvim.terminal", event = "TermClose" })
