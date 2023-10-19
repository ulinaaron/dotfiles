_G.MVIM = {}
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
-- Options
-----------------------------------------------------------
vim.g.mapleader = " "
vim.opt.listchars = { extends = '.', precedes = '|', nbsp = '_', tab = '└─┘' }
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamed,unnamedplus"

-----------------------------------------------------------
-- Keybindings
-----------------------------------------------------------

MVIM.leader_group_clues = {
  { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
  { mode = 'n', keys = '<Leader>f', desc = '+Find' },
  { mode = 'n', keys = '<Leader>g', desc = '+Git' },
  { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
  { mode = 'n', keys = '<Leader>o', desc = '+Other' },
  { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },

  { mode = 'x', keys = '<Leader>l', desc = '+LSP' },
}

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>q", "<cmd>confirm q<CR>", { noremap = true, silent = true, desc = 'Quit' })

keymap("n", "<leader>ff", "<cmd>lua MiniPick.builtin.files()<cr>", { noremap = true, silent = true, desc = 'Find File' })
keymap("n", "<leader>fm", "<cmd>lua MiniFiles.open()<cr>", { noremap = true, silent = true, desc = 'Find Manualy' })
keymap("n", "<leader>fb", "<cmd>lua MiniPick.builtin.buffers()<cr>",
  { noremap = true, silent = true, desc = 'Find Buffer' })
keymap("n", "<leader>fs", "<cmd>lua MiniPick.builtin.grep_live()<cr>",
  { noremap = true, silent = true, desc = 'Find String' })
keymap("n", "<leader>fh", "<cmd>lua MiniPick.builtin.help()<cr>", { noremap = true, silent = true, desc = 'Find Help' })

keymap("n", "<leader>ss", "<cmd>lua MiniSessions.select()<cr>",
  { noremap = true, silent = true, desc = 'Switch Session' })

keymap("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = 'Close Buffer' })

keymap("n", "<leader>gg", "<cmd>terminal lazygit<cr>", { noremap = true, silent = true, desc = 'Lazygit' })
keymap("n", "<leader>gp", "<cmd>terminal git pull<cr>", { noremap = true, silent = true, desc = 'Git Push' })
keymap("n", "<leader>gs", "<cmd>terminal git push<cr>", { noremap = true, silent = true, desc = 'Git Pull' })
keymap("n", "<leader>ga", "<cmd>terminal git add .<cr>", { noremap = true, silent = true, desc = 'Git Add All' })
keymap("n", "<leader>gc", '<cmd>terminal git commit -m "Autocommit from MVIM"<cr>',
  { noremap = true, silent = true, desc = 'Git Autocommit' })


keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = 'File Explorer' })

-----------------------------------------------------------
-- Automatic Commands
-----------------------------------------------------------

-- Automatically close tab/vim when NvimTree is the last window in the tab.
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-----------------------------------------------------------
-- Utility Functions
-----------------------------------------------------------

MVIM.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and H.keys['ctrl-y'] or H.keys['ctrl-y_cr']
  else
    return require('mini.pairs').cr()
  end
end

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
local lazy = require("config.lazy")

require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth" },
  {
    "echasnovski/mini.nvim",
    dependencies = {

      { "nvim-tree/nvim-web-devicons" },
    },
    config = require("config.plugins.mini")
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a"
  },
  require("user.nvim-tree"),
  require("user.treesitter"),
  require("user.lsp"),
  require("user.noice"),
  require("user.gitsigns")
}
)
