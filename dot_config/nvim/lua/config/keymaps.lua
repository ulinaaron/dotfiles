-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Copy all
vim.keymap.set("n", "<C-c>", '"+y')

-- Copy in visual mode and maintain position
vim.api.nvim_set_keymap("v", "<C-c>", [["+y`']], { noremap = true, silent = true })

-- Copy current line
vim.keymap.set("n", "<C-Shift-c>", '"+yy')

-- Copy and paste current line
vim.api.nvim_set_keymap("n", "<C-c>", ':let @+=expand("%")<CR>o<C-r>+<Esc>', { expr = true })

-- Paste
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })

-- Paste above current line
vim.keymap.set("n", "<C-Shift-v>", '"+P')

-- Select all in normal mode
vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>G", { noremap = true })

-- Select all in visual mode
vim.api.nvim_set_keymap("v", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Select all in insert mode
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Save file as
vim.keymap.set("n", "<C-Shift-s>", ":w!<CR>")

-- Close active buffer (like closing a tab)
vim.keymap.set("n", "<C-w>", ":bd<CR>")

-- Open file
vim.keymap.set("n", "<C-o>", ":e <C-r>=expand('%:p:h').'/'<CR>")

-- Undo
vim.api.nvim_set_keymap("i", "<C-z>", "<C-u>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-z>", "<C-u>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true })

-- Redo
vim.keymap.set("n", "<C-Shift-z>", "<C-r>")

-- Select current line
vim.api.nvim_set_keymap("n", "x", "V", { noremap = true })

-- Quit
vim.api.nvim_set_keymap("n", "<C-q>", ":qa!<CR>", { noremap = true })

-- Toggle Comments
vim.keymap.set("n", "<C-/>", "gcc", { noremap = true })
vim.keymap.set("v", "<C-/>", "gc", { noremap = true })

-- Enter and exit Insert mode
vim.keymap.set("n", "<BS>", "i")
vim.keymap.set("n", "i", "i")

-- Go to start of line
vim.api.nvim_set_keymap("i", "<A-S-Left>", "<ESC>I", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-S-Left>", "^", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-S-Left>", "^", { noremap = true })

-- Go to end of line
vim.api.nvim_set_keymap("i", "<A-S-Right>", "<ESC>A", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-S-Right>", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-S-Right>", "$", { noremap = true })

-- Go to top of screen
vim.api.nvim_set_keymap("n", "<A-S-Up>", "<C-u>", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-S-Up>", "<C-u>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-S-Up>", "<C-o><C-u>", { noremap = true })

-- Go to bottom of screen
vim.api.nvim_set_keymap("n", "<A-S-Down>", "<C-d>", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-S-Down>", "<C-d>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-S-Down>", "<C-o><C-d>", { noremap = true })

-- Keybinding to move up 5 lines in all modes
vim.api.nvim_set_keymap("n", "<S-Up>", "5k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Esc>5ki", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "<Esc>5k", { noremap = true, silent = true })

-- Keybinding to move down 5 lines in all modes
vim.api.nvim_set_keymap("n", "<S-Down>", "5j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<Esc>5ji", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "<Esc>5j", { noremap = true, silent = true })

-- Keybinding to move the current line up one in all modes
-- vim.api.nvim_set_keymap("n", "<A-S-Up>", ":<C-u>move-2<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<A-S-Up>", "<Esc>:<C-u>move-2<CR>==gi", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<A-S-Up>", ":<C-u>move-2<CR>gv=gv", { noremap = true, silent = true })

-- Indenting
vim.keymap.set("n", "<C-]>", ">>")
vim.keymap.set("v", "<C-]>", ">gv")

vim.keymap.set("n", "<C-[>", "<<")
vim.keymap.set("v", "<C-[>", "<gv")

-- Buffers
vim.api.nvim_set_keymap("n", "<A-,>", "<C-^>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-.>", "<C-6>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-w>", ":bdelete<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<A-e>", ":Neotree focus<CR>", { noremap = true, silent = true })

-- Search and replace
vim.keymap.set("n", "<C-f>", "<leader>sb")
vim.keymap.set("n", "<C-Shift-f>", ":%s//g<Left><Left>") -- Function to check if Neotree is open

vim.api.nvim_set_keymap("v", "<ESC>", ":<C-u>nohlsearch<CR>", { noremap = true, silent = true })

-- Visual Mode improvements
vim.api.nvim_set_keymap("v", "o", ":normal! o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "O", ":normal! O<Esc>", { noremap = true, silent = true })
