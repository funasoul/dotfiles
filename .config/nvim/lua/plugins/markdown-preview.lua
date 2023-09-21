return {
  -- Preview markdown on your modern browser with synchronised scrolling and flexible configuration
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
