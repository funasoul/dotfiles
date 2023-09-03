if true then
  return {}
end
return {
  --  Smart and Powerful commenting plugin for neovim
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>.", "<Plug>(comment_toggle_linewise_current)", mode = "n", desc = "Comment" },
      { "<leader>.", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Comment" },
    },
  },
}
