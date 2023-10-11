local M = {
  "hrsh7th/nvim-cmp",
  commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
    },
    {
      "hrsh7th/cmp-buffer",
      commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
      "hrsh7th/cmp-path",
      commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
      "hrsh7th/cmp-cmdline",
      commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      commit = "18095520391186d634a0045dacaa346291096566",
    },
    {
      "L3MON4D3/LuaSnip",
      commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
        commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
      },
      config = function()
        vim.tbl_map(function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
          { "vscode", "snipmate", "lua" })
      end,
    },
    {
      "hrsh7th/cmp-nvim-lua",
      commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
    },
    {
      'tzachar/cmp-tabnine',
      build = './install.sh',
      config = function()
        local tabnine = require('cmp_tabnine.config')

        tabnine:setup({
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
          run_on_every_keystroke = true,
          snippet_placeholder = '..',
          ignored_file_types = {
            -- default is not to ignore
            -- uncomment to ignore in lua:
            -- lua = true
          },
          show_prediction_strength = false
        })
      end
    }
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local kind_icons = {
    Text = "󰉿",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰆧",
    Class = "󰌗",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰇽",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
    Codeium = "󰚩",
    Copilot = "",
    TabNine = "",
  }

  local function has_words_before()
    local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users -- .
      end,
    },
    mapping = {
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-0>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }), -- functi
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
          cmp_tabnine = "",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "cmp_tabnine", priority = 900 },
      { name = "nvim_lsp",    priority = 1000 },
      { name = "luasnip",     priority = 750 },
      { name = "buffer",      priority = 500 },
      { name = "path",        priority = 250 },
    },
    duplicates = {
      nvim_lsp = 1,
      luasnip = 1,
      cmp_tabnine = 1,
      buffer = 1,
      path = 1,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
