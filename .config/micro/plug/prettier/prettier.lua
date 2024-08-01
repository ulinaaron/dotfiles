VERSION = "1.0.0"
PLUGIN_NAME = "prettier"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local ioutil = import("io/ioutil")
local filepath = import("path/filepath")

function init()
  -- format on save
  config.RegisterCommonOption("prettier", "formatOnSave", true)
  -- require a .prettierrc.js in current working directory
  config.RegisterCommonOption("prettier", "requireConfig", true)
  -- print success message in InfoBar
  config.RegisterCommonOption("prettier", "successMessage", true)
  -- prints error messages if enabled
  config.RegisterCommonOption("prettier", "debug", false)

  config.MakeCommand("prettier", prettier, config.NoComplete)
  config.AddRuntimeFile("prettier", config.RTHelp, "help/prettier.md")
end

function prettier(bp)
  bp:Save()

  if checkConfig(bp) == false then
    -- no config found, don't run
    -- if requireConfig is set to false, don't care and run always
    return
  end

  local output, err = shell.ExecCommand("prettier", "-w", bp.Buf.Path)
  if err then
	if setting(bp, "debug") then
      micro.InfoBar():Message(err)
    end
    return
  end

  bp.Buf:ReOpen()

  if setting(bp, "successMessage") then
    micro.InfoBar():Message("Prettier: " .. output)
  end
end

-- on save
function onSave(bp)
  if setting(bp, "formatOnSave") then
    prettier(bp)
  end
  return true
end

-- checks if a prettier config exists
function checkConfig(bp)
  if setting(bp, "requireConfig") == false then
    return true
  end

  local filename = filepath.Abs(".prettierrc.js")
  local _, err = ioutil.ReadFile(filename)
  if err ~= nil then
    if setting(bp, "debug") then
      micro.InfoBar():Message(err)
    end
  else
    -- a prettier config was found
    return true
  end

  return false
end

-- get setting
function setting(bp, name)
  return bp.Buf.Settings["prettier" .. "." .. name]
end
