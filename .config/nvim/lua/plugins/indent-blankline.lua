return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    -- indent = {
    --   char = "│",
    --   tab_char = "│",
    -- },
    -- scope = { enabled = false },
    -- exclude = {
    --   filetypes = {
    --     "help",
    --     "dashboard",
    --     "NvimTree",
    --     "Trouble",
    --     "lazy",
    --     "mini.starter",
    --     "mason",
    --     "notify",
    --     "toggleterm",
    --     "lazyterm",
    --   },
    -- },
  },
  -- main = "ibl",
  config = function()
    require("ibl").setup()
  end
}
