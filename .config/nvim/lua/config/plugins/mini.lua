return function()
  require('mini.statusline').setup({
    -- We don't use an icon plugin
    use_icons = false
  })
  local animate = require('mini.animate')
  animate.setup {
    scroll = {
      -- Disable Scroll Animations, as the can interfer with mouse Scrolling
      enable = false,
    },
    cursor = {
      timing = animate.gen_timing.cubic({ duration = 50, unit = 'total' })
    },
  }
  require('mini.basics').setup({
    options = {
      extra_ui = true,
      win_borders = 'double',
    },
    mappings = {
      windows = true,
      move_with_alt = true,
    },
    autocommands = {
      relnum_in_visual_mode = true,
    }
  })
  -- require('mini.hues').setup({ background = '#241E35', foreground = '#C1B7DE', n_hues = 8, saturation = "medium", accent = "bg"})
  require('mini.base16').setup({
    palette = {
      base00 = "#24283b",
      base01 = "#1f2335",
      base02 = "#292e42",
      base03 = "#565f89",
      base04 = "#a9b1d6",
      base05 = "#c0caf5",
      base06 = "#c0caf5",
      base07 = "#c0caf5",
      base08 = "#f7768e",
      base09 = "#ff9e64",
      base0A = "#e0af68",
      base0B = "#9ece6a",
      base0C = "#1abc9c",
      base0D = "#41a6b5",
      base0E = "#bb9af7",
      base0F = "#ff007c"
    }
  })
  require('mini.comment').setup()
  require('mini.completion').setup()
  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
      hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
      todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
      note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
  require('mini.trailspace').setup()
  require('mini.fuzzy').setup()

  local miniclue = require('mini.clue')
  miniclue.setup({
    clues = {
      MVIM.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },

    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- mini.basics
      { mode = 'n', keys = [[\]] },

      -- mini.bracketed
      { mode = 'n', keys = '[' },
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    window = { config = { border = 'double' } },
  })


  require('mini.files').setup()
  require('mini.move').setup()
  require('mini.indentscope').setup({
    draw = {
      animation = function(s, n) return 5 end,
    },
    symbol = "│"
  })
  require('mini.pick').setup({
    mappings = {
      choose_in_vsplit = '<C-CR>',
    },
    options = {
      use_cache = true
    },
    window = {
      config = win_config,
    }
  })

  require('mini.pairs').setup({ modes = { insert = true, command = true, terminal = true } })
  vim.keymap.set('i', '<CR>', 'v:lua.MVIM.cr_action()', { expr = true })

  require('mini.sessions').setup({
    autowrite = true
  })
  require('mini.starter').setup({
    header =
    "███╗   ███╗██╗   ██╗██╗███╗   ███╗\n████╗ ████║██║   ██║██║████╗ ████║\n██╔████╔██║██║   ██║██║██╔████╔██║\n██║╚██╔╝██║╚██╗ ██╔╝██║██║╚██╔╝██║\n██║ ╚═╝ ██║ ╚████╔╝ ██║██║ ╚═╝ ██║\n╚═╝     ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝\n                                  "
  })
  require('mini.surround').setup()
  require('mini.tabline').setup()
end
