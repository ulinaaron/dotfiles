local lush = require('lush')
local hsl = lush.hsl

-- Define your color palette
local colors = {
  bg = hsl(236, 22, 7),     -- background
  fg = hsl(158, 151, 66),   -- foreground
  red = hsl(200, 64, 50),   -- red
  blue = hsl(205, 76, 67),  -- blue
  green = hsl(123, 45, 71), -- green
}

-- Define your color scheme
local theme = lush(function()
  return {
    -- Editor
    Normal { fg = colors.fg, bg = colors.bg },

    -- Syntax highlighting
    Comment { fg = hsl(200, 24, 58), gui = "italic" }, -- grayish color + italic style
    Identifier { fg = colors.red },
    Statement { fg = colors.blue, gui = "bold" },
    PreProc { fg = colors.green },

    -- Tree sitter colors
    TSAnnotation { fg = colors.blue },
    TSAttribute { fg = colors.green },
  }
end)

-- Return the theme
return theme
