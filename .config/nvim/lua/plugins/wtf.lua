return {
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      search_engine = "duck_duck_go",
    },
    keys = {
      {
        mode = { "n", "x" },
        "<leader>cW",
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "<leader>cw",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with DuckDuckGo",
      },
    },
  },
}
