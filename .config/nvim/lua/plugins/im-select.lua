return {
  -- IME: Force US keyboard layout when entering normal mode
  -- requires https://github.com/laishulu/macism
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({
        default_im_select = "com.google.inputmethod.Japanese.Roman",
      })
    end,
  },
}
