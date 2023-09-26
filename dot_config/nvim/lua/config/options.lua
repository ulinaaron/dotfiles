-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.swapfile = false -- Don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- Show line number
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.relativenumber = false
vim.opt.linespace = -1

-----------------------------------------------------------
-- Neovide
-----------------------------------------------------------
if vim.g.neovide then
  vim.o.guifont = "Hasklug Nerd Font:h13:#e-subpixelantialias:#h-slight"

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.93
  vim.g.neovide_background_color = "#24283b" .. alpha()

  vim.g.neovide_floating_blur_amount_x = 1.0
  vim.g.neovide_floating_blur_amount_y = 1.0
  vim.g.neovide_input_macos_alt_is_meta = true

  vim.g.neovide_padding_top = 24
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = -1
  vim.g.neovide_padding_left = -1

  vim.g.neovide_scale_factor = 1.20
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_vfx_mode = "ripple"
end
