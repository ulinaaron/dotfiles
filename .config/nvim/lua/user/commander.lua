return {
  "FeiyouG/commander.nvim",
  lazy = true,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("commander").setup({
      components = {
        "DESC",
        "KEYS",
        "CAT",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD"
      },
 -- Default title of the prompt
  prompt_title = "Commands",
      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = true,
          set_plugin_name_as_cat = true
        }
      }
    })
  end,
}
