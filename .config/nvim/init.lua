-- WARN: must go before your colorscheme is sourced
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- WARN: `vim.api.nvim_get_hl` only works in 0.9+.
    --       Use `nvim_get_hl_by_name for lower versions.

    local tabline = vim.api.nvim_get_hl(0, { link = false, name = 'TabLine' })
    for _, hl in ipairs(vim.fn.getcompletion('BufferDefaultCurrent*', 'highlight')) do
      local definition = vim.api.nvim_get_hl(0, { link = false, name = hl:gsub('Default', '') })
      definition.bg = tabline.bg
      definition.ctermbg = tabline.ctermbg
      vim.api.nvim_set_hl(0, hl, definition)
    end

    local tabline_fill = vim.api.nvim_get_hl(0, { link = false, name = 'TabLineFill' })
    for _, activity in ipairs { 'Alternate', 'Inactive', 'Visible' } do
      for _, hl in ipairs(vim.fn.getcompletion('BufferDefault' .. activity .. '*', 'highlight')) do
        local definition = vim.api.nvim_get_hl(0, { link = false, name = hl:gsub('Default', '') })
        definition.bg = tabline_fill.bg
        definition.ctermbg = tabline_fill.ctermbg
        vim.api.nvim_set_hl(0, hl, definition)
      end
    end

    local special = vim.api.nvim_get_hl(0, { link = false, name = 'Special' })
    vim.api.nvim_set_hl(0, 'BufferScrollArrow', special)
    vim.api.nvim_set_hl(0, 'BufferTabpagesSep', special)
    vim.api.nvim_set_hl(0, 'BufferTabpages', special)
    vim.api.nvim_set_hl(0, 'BufferTabpagesSep', special)
    vim.api.nvim_set_hl(0, 'BufferCurrent', special)
    vim.api.nvim_set_hl(0, 'BufferCurrentIndex', special)
    vim.api.nvim_set_hl(0, 'BufferCurrentMod', special)
    vim.api.nvim_set_hl(0, 'BufferCurrentSign', special)
  end,
  group = vim.api.nvim_create_augroup('config', { clear = false })
})

require "options"
require "Lazy"
require "keymaps"
require "autocommands"
