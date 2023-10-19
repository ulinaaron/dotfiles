-----------------------------------------------------------
-- Load Lazy Manager
-----------------------------------------------------------
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Start Up
-----------------------------------------------------------
vim.g.mapleader = " "

-----------------------------------------------------------
-- Keybindings
-----------------------------------------------------------


-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },
  {
    "echasnovski/mini.nvim",
  }
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a"
  },


  -- { import = "user" }
}, {
  -- install = { colorscheme = { require("user.theme_nightfox").name } },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
