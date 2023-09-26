-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--

-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- Always display absolute (exact) line numbers
autocmd("BufEnter, VimEnter, WinEnter", {
  pattern = "*",
  command = "set number",
})

vim.api.nvim_exec(
  [[
let g:mouse_a = ""

augroup prevent_highlight_yank
    autocmd!
    au TextYankPost * lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup end
]],
  false
)

vim.cmd("hi OffsetLine ctermbg=black guibg=#141414 guifg=#141414")

vim.cmd("hi TAB_INACTIVE guibg=#909090")
