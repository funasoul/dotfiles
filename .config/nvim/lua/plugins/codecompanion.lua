return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    language = "Japanese",
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "gemini",
        model = "gemini-2.5-pro",
      },
      inline = {
        adapter = "gemini",
        model = "gemini-2.0-flash",
      },
      code = {
        adapter = "gemini",
        model = "gemini-2.0-flash",
      },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
  },
}
