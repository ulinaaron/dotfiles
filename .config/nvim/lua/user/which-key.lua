local M = {
  "folke/which-key.nvim",
  commit = "5224c261825263f46f6771f1b644cae33cd06995",
  event = "VeryLazy",
  opts = {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  },
}

function M.config(_, opts)
  require("which-key").setup(opts)
  require("utils").which_key_register()
end

return M
