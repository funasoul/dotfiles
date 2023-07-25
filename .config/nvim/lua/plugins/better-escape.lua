return {
  --  lua version of better_escape.vim, with some additional features and optimizations
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" },
      })
    end,
  },
}
