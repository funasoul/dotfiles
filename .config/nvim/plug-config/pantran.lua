local actions = require("pantran.ui.actions")
require("pantran").setup{
  engines = {
    -- Configuration for individual engines goes here. To list available
    -- engine names run `:lua =vim.tbl_keys(require("pantran.engines"))`.
    default_engine = "deepl",
    deepl = {
      -- Default languages can be defined on a per engine basis. In this case
      -- `:lua require("pantran.async").run(function()
      -- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
      -- can be used to list available language identifiers.
      default_source = "auto",
      default_target = "en"
    },
  },
  controls = {
    mappings = {
      edit = {
        n = {
          -- Use this table to add additional mappings for the normal mode in
          -- the translation window. Either strings or function references are
          -- supported.
          ["?"] = "g?",
          ["j"] = "gj",
          ["k"] = "gk",
          -- ["<leader>t"] = actions.select_target
        },
        i = {
          -- Similar table but for insert mode. Using 'false' disables
          -- existing keybindings.
          -- ["<C-y>"] = false,
          -- ["<C-a>"] = actions.yank_close_translation
        }
      },
      select = {
        n = {
          -- Keybindings here are used in the selection window.
        }
      }
    }
  }
}
