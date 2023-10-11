local M = {}

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  'intelephense',
}

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

--- Get an icon from the AstroNvim internal icons if it is available and return it
---@param kind string The kind of icon in astronvim.icons to retrieve
---@param padding? integer Padding to add to the end of the icon
---@param no_fallback? boolean Whether or not to disable fallback to text icon
---@return string icon
function M.get_icon(kind, padding, no_fallback)
  if not vim.g.icons_enabled and no_fallback then return "" end
  local icon_pack = vim.g.icons_enabled and "icons" or "text_icons"
  if not M[icon_pack] then
    M.icons = require "utils.icons.nerd_font"
    M.text_icons = require "utils.icons.text"
  end
  local icon = M[icon_pack] and M[icon_pack][kind]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

--- Register queued which-key mappings
function M.which_key_register()
  if M.which_key_queue then
    local wk_avail, wk = pcall(require, "which-key")
    if wk_avail then
      for mode, registration in pairs(M.which_key_queue) do
        wk.register(registration, { mode = mode })
      end
      M.which_key_queue = nil
    end
  end
end

--- Get an empty table of mappings with a key for each map mode
---@return table<string,table> # a table with entries for each map mode
function M.empty_map_table()
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
function M.set_mappings(map_table, base)
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
        if not cmd or keymap_opts.name then -- if which-key mapping, queue it
          if not keymap_opts.name then keymap_opts.name = keymap_opts.desc end
          if not M.which_key_queue then M.which_key_queue = {} end
          if not M.which_key_queue[mode] then M.which_key_queue[mode] = {} end
          M.which_key_queue[mode][keymap] = keymap_opts
        else -- if not which-key mapping, set it
          vim.keymap.set(mode, keymap, cmd, keymap_opts)
        end
      end
    end
  end
  if package.loaded["which-key"] then M.which_key_register() end -- if which-key is loaded already, register
end

--- Toggle a user terminal if it exists, if not then create a new one and save it
---@param opts string|table A terminal command string or a table of options for Terminal:new() (Check toggleterm.nvim documentation for table format)
function M.toggle_term_cmd(opts)
  local terms = {}
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(opts) == "string" then opts = { cmd = opts, hidden = true } end
  local num = vim.v.count > 0 and vim.v.count or 1
  -- if terminal doesn't exist yet, create it
  if not terms[opts.cmd] then terms[opts.cmd] = {} end
  if not terms[opts.cmd][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
    if not opts.on_exit then opts.on_exit = function() terms[opts.cmd][num] = nil end end
    terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  terms[opts.cmd][num]:toggle()
end

--- Serve a notification with a title of AstroNvim
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function() vim.notify(msg, type, M.extend_tbl({ title = "Ulinaaron" }, opts)) end)
end

--- Trigger an AstroNvim user event
---@param event string The event name to be appended to Astro
---@param delay? boolean Whether or not to delay the event asynchronously (Default: true)
function M.event(event, delay)
  local emit_event = function() vim.api.nvim_exec_autocmds("User", { pattern = "Ulinaaron" .. event, modeline = false }) end
  if delay == false then
    emit_event()
  else
    vim.schedule(emit_event)
  end
end

return M
