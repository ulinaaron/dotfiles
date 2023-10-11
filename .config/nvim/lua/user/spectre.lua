return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>f*", function() require("spectre").open() end, desc = "Find & Replace" },
  },
  -- commander = {
  --   {
  --     cmd = function() require("spectre").open() end,
  --     desc = "Replace in files (Spectre)"
  --   },
  -- }
}
