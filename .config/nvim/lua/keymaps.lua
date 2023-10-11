local utils = require "utils"
local ui = require "utils.ui"
local get_icon = utils.get_icon
local is_available = utils.is_available

local maps = require("utils").empty_map_table()

local sections = {
  a = { desc = get_icon("AI", 1, true) .. "AI" },
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  v = { desc = get_icon("Ellipsis", 1, true) .. "View" },
  u = { desc = get_icon("Package", 1, true) .. "Utilities" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  p = { desc = get_icon("Window", 1, true) .. "Preferences" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  -- d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  S = { desc = get_icon("Session", 1, true) .. "Session" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
  w = { desc = "Workspace" }
}

maps.n["<leader>w"] = sections.w

-- Normal --
-- Standard Operations
maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" }

maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }


-- Plugin Manager
maps.n["<leader>p"] = sections.p
maps.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }

-- Artificial Intelligence
maps.n["<leader>a"] = sections.a
maps.n["<leader>ac"] = { "<cmd>CodyChat<cr>", desc = "Cody Chat" }

-- Buffer Navigation
maps.n["<A-,>"] = { "<Cmd>BufferPrevious<CR>", desc = "Previous Buffer" }
maps.n["<A-.>"] = { "<Cmd>BufferNext<CR>", desc = "Next Buffer" }

maps.n["<A-<>"] = { "<Cmd>BufferMovePrevious<CR>", desc = "Re-order Buffer Previous" }
maps.n["<A->>"] = { "<Cmd>BufferMoveNext<CR>", desc = "Re-order Buffer Next" }

-- Buffer Selection
maps.n["<A-1>"] = { "<Cmd>BufferGoto 1<CR>", desc = "Goto Buffer 1" }
maps.n["<A-2>"] = { "<Cmd>BufferGoto 2<CR>", desc = "Goto Buffer 2" }
maps.n["<A-3>"] = { "<Cmd>BufferGoto 3<CR>", desc = "Goto Buffer 3" }
maps.n["<A-4>"] = { "<Cmd>BufferGoto 4<CR>", desc = "Goto Buffer 4" }
maps.n["<A-5>"] = { "<Cmd>BufferGoto 5<CR>", desc = "Goto Buffer 5" }
maps.n["<A-6>"] = { "<Cmd>BufferGoto 6<CR>", desc = "Goto Buffer 6" }
maps.n["<A-7>"] = { "<Cmd>BufferGoto 7<CR>", desc = "Goto Buffer 7" }
maps.n["<A-8>"] = { "<Cmd>BufferGoto 8<CR>", desc = "Goto Buffer 8" }
maps.n["<A-9>"] = { "<Cmd>BufferGoto 9<CR>", desc = "Goto Buffer 9" }
maps.n["<A-0>"] = { "<Cmd>BufferLast<CR>", desc = "Goto Last Buffer" }
-- Pin/unpin buffer
maps.n["<A-p>"] = { "<Cmd>BufferPin<CR>", desc = "Pin/Unpin Buffer" }

-- Close buffer
maps.n["<A-c>"] = { "<Cmd>BufferClose<CR>", desc = "Close Buffer" }
maps.n["<leader>c"] = { "<Cmd>BufferClose<CR>", desc = "Close Current Buffer" }

-- Magic buffer-picking mode
maps.n["<C-p>"] = { "<Cmd>BufferPick<CR>", desc = "Pick Buffer" }

-- Sort buffers automatically by...
maps.n["<Space>bb"] = { "<Cmd>BufferOrderByBufferNumber<CR>", desc = "Sort Buffers By Number" }
maps.n["<Space>bd"] = { "<Cmd>BufferOrderByDirectory<CR>", desc = "Sort Buffers By Directory" }
maps.n["<Space>bl"] = { "<Cmd>BufferOrderByLanguage<CR>", desc = "Sort Buffers By Language" }
maps.n["<Space>bw"] = { "<Cmd>BufferOrderByWindowNumber<CR>", desc = "Sort Buffers By Window Number" }

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Toggle comment line",
  }
  maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment for selection",
  }
end

-- Package Manager
if is_available "mason.nvim" then
  maps.n["<leader>pm"] = { "<cmd>Mason<cr>", desc = "Mason Installer" }
  maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason Update" }
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>f"] = sections.f
  maps.n["<leader>g"] = sections.g
  maps.n["<leader>v"] = sections.v
  maps.n["<leader>gb"] =
  { function() require("telescope.builtin").git_branches { use_file_path = true } end, desc = "Git branches" }
  maps.n["<leader>gc"] = {
    function() require("telescope.builtin").git_commits { use_file_path = true } end,
    desc = "Git commits (repository)",
  }
  maps.n["<leader>gC"] = {
    function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
    desc = "Git commits (current file)",
  }
  maps.n["<leader>gt"] =
  { function() require("telescope.builtin").git_status { use_file_path = true } end, desc = "Git status" }
  maps.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
  maps.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" }
  maps.n["<leader>f/"] =
  { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" }
  maps.n["<leader>vb"] = { function() require("telescope.builtin").buffers() end, desc = "View Buffers" }
  maps.n["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
  maps.n["<leader>vc"] = { function() require("telescope.builtin").commands() end, desc = "View Commands" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find Files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Find Files (Hidden)",
  }
  maps.n["<leader>fp"] = { "<cmd>Telescope projects<CR>", desc = "Find Projects" }
  maps.n["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find TODOs" }
  maps.n["<leader>vh"] = { function() require("telescope.builtin").help_tags() end, desc = "View Help" }
  maps.n["<leader>vk"] = { function() require("telescope.builtin").keymaps() end, desc = "View Keymaps" }
  maps.n["<leader>vm"] = { function() require("telescope.builtin").man_pages() end, desc = "View Manual (Man)" }
  if is_available "nvim-notify" then
    maps.n["<leader>vn"] =
    { function() require("telescope").extensions.notify.notify() end, desc = "View notifications" }
  end
  maps.n["<leader>fr"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find Recent Files" }
  maps.n["<leader>fR"] = { function() require("telescope.builtin").registers() end, desc = "Find Registers" }
  maps.n["<leader>vt"] =
  { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "View themes" }
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Find words in all files",
  }
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.n["<leader>t"] = sections.t
  if vim.fn.executable "lazygit" == 1 then
    maps.n["<leader>g"] = sections.g
    maps.n["<leader>gg"] = {
      function()
        local worktree = require("utils.git").file_worktree()
        local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd("lazygit " .. flags)
      end,
      desc = "Git Client (LazyGit)",
    }
    maps.n["<leader>tl"] = maps.n["<leader>gg"]
  end
  if vim.fn.executable "node" == 1 then
    maps.n["<leader>tn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
  end
  if vim.fn.executable "gdu" == 1 then
    maps.n["<leader>tu"] = { function() utils.toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" }
  end
  if vim.fn.executable "btm" == 1 then
    maps.n["<leader>tt"] = { function() utils.toggle_term_cmd "btm" end, desc = "ToggleTerm btm" }
  end
  maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
  maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<F7>"] = maps.n["<F7>"]
  maps.n["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
  maps.t["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
end

-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "Indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" }

maps.n["<leader>u"] = sections.u
-- Custom menu for modification of the user experience
if is_available "nvim-autopairs" then maps.n["<leader>ua"] = { ui.toggle_autopairs, desc = "Toggle autopairs" } end
maps.n["<leader>ub"] = { ui.toggle_background, desc = "Toggle background" }
if is_available "nvim-cmp" then maps.n["<leader>uc"] = { ui.toggle_cmp, desc = "Toggle autocompletion" } end
if is_available "nvim-colorizer.lua" then
  maps.n["<leader>uC"] = { "<cmd>ColorizerToggle<cr>", desc = "Toggle color highlight" }
end
maps.n["<leader>ud"] = { ui.toggle_diagnostics, desc = "Toggle diagnostics" }
maps.n["<leader>ug"] = { ui.toggle_signcolumn, desc = "Toggle signcolumn" }
maps.n["<leader>ui"] = { ui.set_indent, desc = "Change indent setting" }
maps.n["<leader>ul"] = { ui.toggle_statusline, desc = "Toggle statusline" }
maps.n["<leader>uL"] = { ui.toggle_codelens, desc = "Toggle CodeLens" }
maps.n["<leader>un"] = { ui.change_number, desc = "Change line numbering" }
maps.n["<leader>uN"] = { ui.toggle_ui_notifications, desc = "Toggle Notifications" }
maps.n["<leader>up"] = { ui.toggle_paste, desc = "Toggle paste mode" }
maps.n["<leader>us"] = { ui.toggle_spell, desc = "Toggle spellcheck" }
maps.n["<leader>uS"] = { ui.toggle_conceal, desc = "Toggle conceal" }
maps.n["<leader>ut"] = { ui.toggle_tabline, desc = "Toggle tabline" }
maps.n["<leader>uu"] = { ui.toggle_url_match, desc = "Toggle URL highlight" }
maps.n["<leader>uw"] = { ui.toggle_wrap, desc = "Toggle wrap" }
maps.n["<leader>uy"] = { ui.toggle_syntax, desc = "Toggle syntax highlighting (buffer)" }
maps.n["<leader>uh"] = { ui.toggle_foldcolumn, desc = "Toggle foldcolumn" }


maps.n["<leader>xx"] = { function() require("trouble").open() end, desc = "Open Trouble" }
maps.n["<leader>xw"] = {
  function() require("trouble").open("workspace_diagnostics") end,
  desc = "Open Trouble (Workspace Diagnostics)"
}
maps.n["<leader>xd"] = {
  function() require("trouble").open("document_diagnostics") end,
  desc = "Open Trouble (Document Diagnostics)"
}
maps.n["<leader>xq"] = { function() require("trouble").open("quickfix") end, desc = "Open Trouble (Quickfix)" }
maps.n["<leader>xl"] = { function() require("trouble").open("loclist") end, desc = "Open Trouble (Location List)" }
maps.n["gR"] = { function() require("trouble").open("lsp_references") end, desc = "Open Trouble (LSP References)" }

utils.set_mappings(maps)


-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local commander = require("commander")

function map_opts(desc)
  return {
    silent = true,
    desc = desc
  }
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Copy all
vim.keymap.set("n", "<C-c>", '"+y')

-- Copy in visual mode and maintain position
vim.keymap.set("v", "<C-c>", [["+y`']], { noremap = true, silent = true })

-- Paste
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })

-- Paste above current line
vim.keymap.set("n", "<C-Shift-v>", '"+P')

-- Select all in normal mode
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { noremap = true })

-- Select all in visual mode
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Select all in insert mode
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Close active buffer (like closing a tab)
vim.keymap.set("n", "<C-w>", ":bd<CR>")

-- Open file
vim.keymap.set("n", "<C-o>", ":e <C-r>=expand('%:p:h').'/'<CR>")

-- Undo
vim.keymap.set("i", "<C-z>", "<C-u>", { noremap = true })
vim.keymap.set("v", "<C-z>", "<C-u>", { noremap = true })
vim.keymap.set("n", "<C-z>", "u", { noremap = true })

-- Redo
vim.keymap.set("n", "<C-Shift-z>", "<C-r>")

-- Toggle Comments
vim.keymap.set("n", "<C-/>", "gcc", { noremap = true })
vim.keymap.set("v", "<C-/>", "gc", { noremap = true })

-- Enter and exit Insert mode
vim.keymap.set("n", "<BS>", "i")
vim.keymap.set("n", "i", "i")

-- Indenting
commander.add({
  {
    desc = "Indent line or selection",
    cmd = ">>",
    keys = { "n", "<C-]>" },
    cat = "Indenting"
  },
  {
    desc = "Indent visual selection and reselect",
    cmd = ">gv",
    keys = { "v", "<C-]>" },
    cat = "Indenting"
  },
  {
    desc = "Dedent line or selection",
    cmd = "<<",
    keys = { "n", "<C-[>" },
    cat = "Indenting"
  },
  {
    desc = "Dedent visual selection and reselect",
    cmd = "<gv",
    keys = { "v", "<C-[>" },
    cat = "Indenting"
  },
}, {})

-- Util
vim.api.nvim_set_keymap('n', '<esc>', '<esc>', { noremap = true })
-- For Visual mode
vim.api.nvim_set_keymap('v', '<esc>', '<esc>', { noremap = true })
-- For Select mode
vim.api.nvim_set_keymap('s', '<esc>', '<esc>', { noremap = true })
