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

-- Insert timestamp after "Last Modified: "
vim.cmd([[
 "" Insert timestamp after 'Last Modified: '
 " If buffer modified, update any 'Last Modified: ' in the first 200 lines.
 " 'Last Modified: Fri, 08 Sep 2023 01:12:05 +0900
 " Restores cursor and window position using save_cursor variable.
 function! LastModified()
   if &modified
     let save_cursor = getpos(".")
     let n = min([200, line("$")])
     keepjumps exe '1,' . n . 's#^\(.\{,10}Last [Mm]odified: \).*#\1' .
           \ strftime('%a, %d %b %Y %H:%M:%S %z') . '#e'
     call histdel('search', -1)
     call setpos('.', save_cursor)
   endif
 endfun
 autocmd BufWritePre * call LastModified()
]])
--   ]])
