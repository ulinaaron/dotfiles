return {
  "max397574/better-escape.nvim",
  event = "InsertCharPre",
  config = function()
    require("better_escape").setup()
  end
}
