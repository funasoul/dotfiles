--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "onehalfdark"
lvim.debug = false
lvim.transparent_window = true
-- vim settings
vim.opt.backup = false      -- creates a backup file
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.clipboard = ""
vim.opt.mouse = ""
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.incsearch = false
vim.opt.wrapscan = false
vim.opt.shiftround = true
vim.opt.showmatch = true
vim.opt.timeoutlen = 100

-- Additional Plugins
lvim.plugins = {
  -- colorschemes
  {
    "folke/tokyonight.nvim",
    "Mofiqul/vscode.nvim",
    "shaunsingh/nord.nvim",
    "Th3Whit3Wolf/one-nvim",
    "catppuccin/nvim",
    "olimorris/onedarkpro.nvim",
    "sainnhe/gruvbox-material",
  },
  -- explorer
  {
    "lmburns/lf.nvim",
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      -- vim.g.lf_netrw = 1
      require("lf").setup({
        escape_quit = false,
        border = "rounded",
        -- highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
      })

      vim.keymap.set("n", "<C-o>", ":Lf<CR>")
    end,
    dependencies = { "plenary.nvim", "toggleterm.nvim" }
  },
  -- navigation
  -- -- Neovim's answer to the mouse
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- -- better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  -- Git
  -- -- git wrapper
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  -- -- Vim plugin for Gist (need to setup github token)
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  -- LSP enhancement
  -- -- previewing goto definition calls
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  -- -- cwd to the project's root directory
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  -- -- hint when you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".on_attach()
    end,
  },
  -- -- a tree like view for symbols
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  -- -- diagnostics, references, telescope results, quickfix and location lists
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- General
  -- -- Sniprun is a code runner plugin for neovim written in Lua and Rust
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
  },
  -- -- interactive scratchpad for hackers
  {
    "metakirby5/codi.vim",
    cmd = {
      "Codi",
      "CodiSelect",
      "CodiExpand",
    },
  },
  -- -- "cs" mappings to delete, change and add surroundings
  {
    "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  -- Python
  {
    "AckslD/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
  },
}


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["<C-u>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["Q"] = ":qall<cr>"
lvim.keys.normal_mode["<S-TAB>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<TAB>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<C-n>"] = "<cmd>lua vim.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>lua vim.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>"
lvim.keys.normal_mode["<C-c>c"] = ":'<,'>SnipRun<CR>"
lvim.keys.normal_mode["<C-c><C-c>"] = ":%SnipRun<CR>"
vim.cmd([[
  map P "zp
  map -1 "1p
  map -2 "2p
  map -3 "3p
  map -4 "4p
  map -0 myG"zy'y'y
  map -- mz"zy'k'z
  map -= mz"zd'k'z
  map -y "zy'k
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
  cnoremap <C-b> <Left>
  cnoremap <C-f> <Right>
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-d> <Del>
  nnoremap * :keepjumps normal! mi*`i<CR>
  ]])

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- python virtualenv
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose virtualenv" },
}
lvim.builtin.which_key.mappings["lR"] = { "<cmd>LspRestart<cr>", "Restart LSP" }

-- neotest
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- lvim.builtin.which_key.mappings["o"] = { "<cmd>RnvimrToggle<CR>", "open" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>:Lf<cr>", "open" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["S"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" }
-- Trouble
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- Gist (need to set github token)
lvim.builtin.which_key.mappings["G"] = {
  name = "Gist",
  s = { "<cmd>Gist<cr>", "Post to Gist" },
  e = { "<cmd>Gist -e<cr>", "Edit Gist (you need to have opened the gist buffer first)" },
  l = { "<cmd>Gist -l<cr>", "List your public gists" },
  S = { "<cmd>Gist -ls<cr>", "List your starred gists" },
}
-- Goto preview
lvim.builtin.which_key.mappings["v"] = {
  name = "Preview",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Definition" },
  t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", "Type" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
  c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all window" },
}
-- Codi (interactive scratchpad for hackers)
lvim.builtin.which_key.mappings["C"] = {
  name = "Codi:interactive scratchpad",
  c = { "<cmd>Codi<cr>", "Run current buffer" },
  d = { "<cmd>Codi!<cr>", "Deactivate Codi" },
  t = { "<cmd>Codi!!<cr>", "Toggle Codi" },
  n = { "<cmd>CodiSelect<cr>", "New scratchpad" },
  e = { "<cmd>CodiExpand<cr>", "Expand output in a popup" },
}
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } },
}

-- -- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- -- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
