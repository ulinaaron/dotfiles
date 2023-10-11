local M = {
  "nvim-lualine/lualine.nvim",
  commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local utils = require "utils"

  local get_icon = utils.get_icon

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local branch = {
    "branch",
    symbols = {
      icon = get_icon("Git", 2, true)
    }
  }


  -- stylua: ignore
  local modeMap = {
    ['NORMAL'] = '',
    ['O-PENDING'] = 'O-PENDING',
    ['VISUAL'] = '',
    ['V-LINE'] = '',
    ['V-BLOCK'] = '',
    ['SELECT'] = 'SELECT',
    ['S-LINE'] = 'S-LINE',
    ['S-BLOCK'] = 'S-BLOCK',
    ['INSERT'] = '',
    ['REPLACE'] = 'REPLACE',
    ['V-REPLACE'] = 'V-REPLACE',
    ['COMMAND'] = 'COMMAND',
    ['EX'] = 'EX',
    ['SHELL'] = 'SHELL',
    ['TERMINAL'] = 'TERMINAL',
  }

  local modeFormat = function(str)
    return modeMap[str]
  end

  local spaces = function()
    return get_icon("Space", 1, true) .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
      extensions = {
        "lazy",
        "nvim-tree",
        "toggleterm"
      }
    },
    sections = {
      lualine_a = { { "mode", fmt = function(str) return modeFormat(str) end } },
      lualine_b = { branch, "fancy_diff" },
      lualine_c = {
        { "fancy_cwd", substitute_home = true }
      },
      lualine_x = { "fancy_diagnostics", "fancy_filetype" },
      lualine_y = { spaces },
      lualine_z = { { "location", padding = 0 } }
    },
  }
end

return M
