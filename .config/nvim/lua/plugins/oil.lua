if true then
  return {}
end
return {
  -- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
  {
    "stevearc/oil.nvim",
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
