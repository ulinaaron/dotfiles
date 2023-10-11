local nvim_lsp = require("lspconfig")

nvim_lsp.tailwindcss.document_config.default_config.init_options.userLanguages = { ['html.twig'] = 'twig' }
return {
  filetypes = vim.tbl_deep_extend("force", nvim_lsp.tailwindcss.document_config.default_config.filetypes, { "html.twig" }),
  init_options = {
    userLanguages = {
      ['html.twig'] = 'twig',
    }
  },
  settings = {
    tailwindCss = {
      includeLanguages = {
        ['html.twig'] = 'twig',
      }
    }
  }
}
