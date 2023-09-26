return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  event = "VimEnter",
  config = function()
    -- This is a Lua comment
    -- To ensure NeoTree opens on startup
    vim.api.nvim_exec(
      [[
      autocmd VimEnter * Neotree show
    ]],
      false
    )
  end,
}
