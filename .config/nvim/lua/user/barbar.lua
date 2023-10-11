return {
  'romgrk/barbar.nvim',
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc. -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = nil}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = { text = 'undotree' },
      -- Or, specify the event which the sidebar executes when leaving:
      ['neo-tree'] = { event = 'BufWipeout' },
      -- Or, specify both
      Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
    },
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
