local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  event = "BufReadPre",
}

M.opts = {
  indent = {
    char = "│",
    tab_char = "│",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  scope = { enabled = false },
  filetypes = {
    "help",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
    "lazyterm",
  },
}

return M
