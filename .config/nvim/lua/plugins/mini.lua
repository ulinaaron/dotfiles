return {
  "echasnovski/mini.nvim",
  config = function()
    local animate = require('mini.animate')
    animate.setup {
      scroll = {
        -- Disable Scroll Animations, as the can interfer with mouse Scrolling
        enable = false,
      },
      cursor = {
        timing = animate.gen_timing.cubic({ duration = 75, unit = 'total' })
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
    --
    -- require('mini.base16').setup({
    --   palette = {
    --     base00 = "#1D172F",
    --     base01 = "#241E35",
    --     base02 = "#161027",
    --     base03 = "#7A7094", -- comments:
    --     base04 = "#8BA4E5",
    --     base05 = "#C0AEF4", -- class
    --     base06 = "#af85b3",
    --     base07 = "#806d91",
    --     base08 = "#CCC3E4", -- property, def, second
    --     base09 = "#88CFDF", -- bool
    --     base0A = "#93D1B5",
    --     base0B = "#F8C379", --string
    --     base0C = "#9BC3F6", -- require, brackets
    --     base0D = "#F0B0D8", -- property
    --     base0E = "#FDB5A8", -- scope
    --     base0F = "#C1B7DE", -- parenethesis
    --   }
    -- })

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

        -- Move or match
        { mode = 'n', keys = "m" },

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

      window = {
        config = { border = 'single' },
        delay = 0
      },
    })

    require('mini.files').setup()

    require('mini.move').setup()

    require('mini.indentscope').setup({
      draw = {
        animation = function(s, n) return 5 end,
      },
      symbol = "│",
      options = { try_as_border = true },
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

    require("mini.operators").setup()

    require('mini.pairs').setup({ modes = { insert = true, command = true, terminal = true } })
    vim.keymap.set('i', '<CR>', 'v:lua.MVIM.cr_action()', { expr = true })

    require('mini.sessions').setup({
      autowrite = true
    })

    local pad = string.rep(" ", 0)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end
    local starter = require("mini.starter")
    require('mini.starter').setup({
      header = "",
      evaluate_single = true,
      items = {
        new_section("Find file", "Telescope find_files", "Telescope"),
        new_section("Recent files", "Telescope oldfiles", "Telescope"),
        new_section("Grep text", "Telescope live_grep", "Telescope"),
        new_section("New file", "ene | startinsert", "Built-in"),
        new_section("Quit", "qa", "Built-in"),
        new_section("Session restore", [[mksession]], "Session"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },

    })

    require('mini.surround').setup()
  end

}
