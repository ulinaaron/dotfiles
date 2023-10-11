return {
  'Exafunction/codeium.vim',
  event = "VeryLazy",
  enabled = false,
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<c-0>0', function() return vim.fn['codeium#Accept']() end,
      { expr = true, desc = "Codeium - Accept Completion" })
    vim.keymap.set('i', '<c-0>c', function() return vim.fn['codeium#CycleCompletions'](1) end,
      { expr = true, desc = "Codeium - Cycle Completion Forwards" })
    vim.keymap.set('i', '<c-0>n', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, desc = "Codeium - Cycle Completion Backwards" })
    vim.keymap.set('i', '<c-0>x', function() return vim.fn['codeium#Clear']() end,
      { expr = true, desc = "Codeium - Clear Completion" })
  end
}
