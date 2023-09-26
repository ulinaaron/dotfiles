return {
  "echasnovski/mini.starter",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "                                                         ",
      "   ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      "   ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      "   ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      "   ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      "   ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      "   ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }, "\n")
    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("N New file",     "ene | startinsert",    ""),
        new_section("F Find file",    "Telescope find_files", ""),
        new_section("R Recent files", "Telescope oldfiles",   ""),
        new_section("S Search",    "Telescope live_grep",  ""),
        new_section("P Projects",    "Telescope projects",  ""),
        new_section("Q Quit",         "qa",                   ""),
        new_section("X Restore Session", [[lua require("persistence").load()]], "Session"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "", false),
        starter.gen_hook.aligning("center", "top"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(starter.refresh)
      end,
    })
  end,
}
