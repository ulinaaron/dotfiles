local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "226c1475a46a2ef6d840af9caa0117a439465500",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    {
      'HiPhish/nvim-ts-rainbow2',
      event = "VeryLazy",
      commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
      build = ":TSUpdate",
      config = function()
        -- lazy = true,
        require('nvim-treesitter.configs').setup {
          rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            disable = { 'jsx', 'cpp' },
            -- Which query to use for finding delimiters
            query = 'rainbow-parens',
            -- Highlight the entire buffer all at once
            strategy = require('ts-rainbow').strategy.global,
          },
        }
      end
    },
    {
      "derekstride/tree-sitter-sql"
    },
    {
      "gbprod/php-enhanced-treesitter.nvim"
    },
    {
      "windwp/nvim-ts-autotag",
      opts = {
        autotag = {
          enable_close_on_slash = false,
          filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
            'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs', "tpl"
          }
        }
      }
    },
  },
}
function M.config()
  local configs = require "nvim-treesitter.configs"

  configs.setup({
    highlight = {
      enable = true,
    },
    -- enable indentation
    indent = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })
end

return M
