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

--- Get an empty table of mappings with a key for each map mode
---@return table<string,table> # a table with entries for each map mode
MVIM.empty_map_table = function()
    local maps = {}
    for _, mode in ipairs { "", "n", "v", "x", "s", "o", "!", "i", "l", "c", "t" } do
        maps[mode] = {}
    end
    if vim.fn.has "nvim-0.10.0" == 1 then
        for _, abbr_mode in ipairs { "ia", "ca", "!a" } do
            maps[abbr_mode] = {}
        end
    end
    return maps
end

--- Table based API for setting keybindings
---@param map_table table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
---@param base? table A base set of options to set on every keybinding
MVIM.set_mappings = function(map_table, base)
    -- iterate over the first keys for each mode
    base = base or {}
    for mode, maps in pairs(map_table) do
        -- iterate over each keybinding set in the current mode
        for keymap, options in pairs(maps) do
            -- build the options for the command accordingly
            if options then
                local cmd = options
                local keymap_opts = base
                if type(options) == "table" then
                    cmd = options[1]
                    keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
                    keymap_opts[1] = nil
                end
                vim.keymap.set(mode, keymap, cmd, keymap_opts)
            end
        end
    end
end

-----------------------------------------------------------
-- Options
-----------------------------------------------------------

local opt = vim.opt

vim.g.mapleader = " "
opt.backup = false                          -- creates a backup file
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0                         -- always show tabs
opt.smartcase = true                        -- smart case
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- creates a swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeout = true
opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true                        -- convert tabs to spaces
opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
opt.tabstop = 2                             -- insert 2 spaces for a tab
opt.cursorline = true                       -- highlight the current line
opt.number = true                           -- set numbered lines
opt.laststatus = 3                          -- only the last window will always have a status line
opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
opt.ruler = false                           -- hide the line and column number of the cursor position
opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
opt.signcolumn =
"yes"                                       -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
opt.fillchars.eob = " "                     -- show empty lines at the end of a buffer as ` ` {default `~`}
opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
opt.whichwrap:append "<,>,[,],h,l"          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.iskeyword:append "-"                    -- treats words with `-` as single words
opt.formatoptions:remove { "c", "r", "o" }  -- This is a sequence of letters which describes how automatic formatting is to be done
opt.linebreak = true

-----------------------------------------------------------
-- Keybindings
-----------------------------------------------------------

local keys = MVIM.empty_map_table()
local is_available = MVIM.is_available

MVIM.leader_group_clues = {
    { mode = 'n', keys = '<Leader>a', desc = '+AI' },
    { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
    { mode = 'n', keys = '<Leader>f', desc = '+Find' },
    { mode = 'n', keys = '<Leader>g', desc = '+Git' },
    { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
    { mode = 'n', keys = '<Leader>o', desc = '+Other' },
    { mode = 'n', keys = '<Leader>p', desc = '+Preferences' },
    { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },
    { mode = 'n', keys = '<Leader>u', desc = '+Utilities' },
    { mode = 'n', keys = '<Leader>v', desc = '+View' },
    { mode = 'n', keys = '<Leader>w', desc = '+Workspace' },


    { mode = "n", keys = "ml",        desc = "Lines" },
}

local keymap = vim.api.nvim_set_keymap

-- Normal --
-- Standard Operations
keys.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
keys.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
keys.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
keys.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
keys.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
keys.n["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" }

keys.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
keys.n["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" }
keys.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
keys.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

-- Stay in indent mode
keys.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
keys.v["<Tab>"] = { ">gv", desc = "Indent line" }

-- Plugin Manager
keys.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
keys.n["<leader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
keys.n["<leader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
keys.n["<leader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
keys.n["<leader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }

-- Artificial Intelligence
keys.n["<leader>ac"] = { "<cmd>CodyChat<cr>", desc = "Cody Chat" }

-- Buffer Navigation
keys.n["<A-,>"] = { "<Cmd>BufferPrevious<CR>", desc = "Previous Buffer" }
keys.n["<A-.>"] = { "<Cmd>BufferNext<CR>", desc = "Next Buffer" }

keys.n["<A-<>"] = { "<Cmd>BufferMovePrevious<CR>", desc = "Re-order Buffer Previous" }
keys.n["<A->>"] = { "<Cmd>BufferMoveNext<CR>", desc = "Re-order Buffer Next" }

-- Buffer Selection
keys.n["<A-1>"] = { "<Cmd>BufferGoto 1<CR>", desc = "Goto Buffer 1" }
keys.n["<A-2>"] = { "<Cmd>BufferGoto 2<CR>", desc = "Goto Buffer 2" }
keys.n["<A-3>"] = { "<Cmd>BufferGoto 3<CR>", desc = "Goto Buffer 3" }
keys.n["<A-4>"] = { "<Cmd>BufferGoto 4<CR>", desc = "Goto Buffer 4" }
keys.n["<A-5>"] = { "<Cmd>BufferGoto 5<CR>", desc = "Goto Buffer 5" }
keys.n["<A-6>"] = { "<Cmd>BufferGoto 6<CR>", desc = "Goto Buffer 6" }
keys.n["<A-7>"] = { "<Cmd>BufferGoto 7<CR>", desc = "Goto Buffer 7" }
keys.n["<A-8>"] = { "<Cmd>BufferGoto 8<CR>", desc = "Goto Buffer 8" }
keys.n["<A-9>"] = { "<Cmd>BufferGoto 9<CR>", desc = "Goto Buffer 9" }
keys.n["<A-0>"] = { "<Cmd>BufferLast<CR>", desc = "Goto Last Buffer" }
-- Pin/unpin buffer
keys.n["<A-p>"] = { "<Cmd>BufferPin<CR>", desc = "Pin/Unpin Buffer" }

-- Close buffer
keys.n["<A-c>"] = { "<Cmd>BufferClose<CR>", desc = "Close Buffer" }
keys.n["<leader>c"] = { "<Cmd>BufferClose<CR>", desc = "Close Current Buffer" }

-- Magic buffer-picking mode
keys.n["<C-p>"] = { "<Cmd>BufferPick<CR>", desc = "Pick Buffer" }

-- Sort buffers automatically by...
keys.n["<Space>bb"] = { "<Cmd>BufferOrderByBufferNumber<CR>", desc = "Sort Buffers By Number" }
keys.n["<Space>bd"] = { "<Cmd>BufferOrderByDirectory<CR>", desc = "Sort Buffers By Directory" }
keys.n["<Space>bl"] = { "<Cmd>BufferOrderByLanguage<CR>", desc = "Sort Buffers By Language" }
keys.n["<Space>bw"] = { "<Cmd>BufferOrderByWindowNumber<CR>", desc = "Sort Buffers By Window Number" }

-- Telescope
keys.n["<leader>gb"] =
{ function() require("telescope.builtin").git_branches { use_file_path = true } end, desc = "Git branches" }
keys.n["<leader>gc"] = {
    function() require("telescope.builtin").git_commits { use_file_path = true } end,
    desc = "Git commits (repository)",
}
keys.n["<leader>gC"] = {
    function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
    desc = "Git commits (current file)",
}
keys.n["<leader>gt"] =
{ function() require("telescope.builtin").git_status { use_file_path = true } end, desc = "Git status" }
keys.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
keys.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" }
keys.n["<leader>f/"] =
{ function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" }
keys.n["<leader>fB"] = { '<cmd>Telescope file_browser<CR>', desc = "File Browser (RD)" }
keys.n["<leader>fb"] = {
    '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
    desc = "File Browser (CWD)"
}
keys.n["<leader>vb"] = { function() require("telescope.builtin").buffers() end, desc = "View Buffers" }
keys.n["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
keys.n["<leader>vc"] = { function() require("telescope.builtin").commands() end, desc = "View Commands" }
keys.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find Files" }
keys.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Find Files (Hidden)",
}
keys.n["<leader>fp"] = { "<cmd>Telescope projects<CR>", desc = "Find Projects" }
keys.n["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find TODOs" }
keys.n["<leader>vh"] = { function() require("telescope.builtin").help_tags() end, desc = "View Help" }
keys.n["<leader>vk"] = { function() require("telescope.builtin").keymaps() end, desc = "View Keymaps" }
keys.n["<leader>vm"] = { function() require("telescope.builtin").man_pages() end, desc = "View Manual (Man)" }

keys.n["<leader>fr"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find Recent Files" }
keys.n["<leader>fR"] = { function() require("telescope.builtin").registers() end, desc = "Find Registers" }
keys.n["<leader>vt"] =
{ function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "View themes" }
keys.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
keys.n["<leader>fW"] = {
    function()
        require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
    end,
    desc = "Find words in all files",
}
keys.n["<leader>ls"] = {
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

MVIM.set_mappings(keys)

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

-- Util
vim.api.nvim_set_keymap('n', '<esc>', '<esc>', { noremap = true })
-- For Visual mode
vim.api.nvim_set_keymap('v', '<esc>', '<esc>', { noremap = true })
-- For Select mode
vim.api.nvim_set_keymap('s', '<esc>', '<esc>', { noremap = true })

-----------------------------------------------------------
-- Automatic Commands
-----------------------------------------------------------

-- Automatically close tab/vim when NvimTree is the last window in the tab.
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

require("lazy").setup({
    -- Detect tabstop and shiftwidth automatically
    { "tpope/vim-sleuth" },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a"
    },
    { import = "plugins" }
}, {
    -- Fine tuning
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
}
)
