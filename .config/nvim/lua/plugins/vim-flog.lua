return {
  --  Flog is a fast, beautiful, and powerful git branch viewer for Vim.
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    keys = { { "<leader>gF", "<cmd>Flogsplit<cr>", desc = "Git Graph" } },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
}
