return {
  -- 'ulinaaron/midnightarcade.nvim',
  dir = "~/.config/nvim/projects/midnightarcade.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('midnightarcade').setup({
      transparent = true
    })
  end,
  init = function()
    vim.cmd("colorscheme midnightarcade")
  end
}
