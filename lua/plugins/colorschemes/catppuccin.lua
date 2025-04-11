local cat = {
  teal = "#FAE3B0",
  lav = "#AB9DFD",
  purple = "#9684FC",
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = false,
  lazy = false,
  opts = {
    flavour = "mocha", -- latte, frappe (when alacritty is transparent), macchiato, mocha
    no_italic = true,
    transparent_background = true,
    color_overrides = {
      all = {
        -- teal = cat.purple,
        teal = cat.teal,
      },
    },
    -- If you were to do catppuccin again redo all of these colors
    highlight_overrides = {
      all = function(colors)
        return {
          ["@tag.attribute.tsx"] = { fg = cat.lav },
          ["@tag.delimiter"] = { fg = colors.flamingo },
          ["@tag.delimiter.astro"] = { fg = cat.lav },
          ["@tag.attribute.astro"] = { fg = cat.lav },
          ["@tag.delimiter.tsx"] = { fg = cat.lav },
          ["@tag.tsx"] = { fg = colors.yellow },
          ["@keyword.export.tsx"] = { fg = colors.lavender },
          ["@keyword.export.typescript"] = { fg = colors.lavender },
          ["@operator"] = { fg = colors.subtext1 },
          ["@markup.link.label"] = { fg = cat.purple },
          ["@markup.heading.5.markdown"] = { fg = colors.blue },
          -- CursorLineNr = { fg = colors.mauve, style = { "bold" } },

          -- Noice
          NoiceCmdlinePopupTitle = { fg = colors.mauve, style = { "bold" } },
          NoiceCmdlineIcon = { fg = colors.mauve },

          -- Todo
          TodoFgTODO = { fg = colors.yellow },
          TodoBgTODO = { fg = colors.mantle, bg = colors.yellow, style = { "bold" } },
          TodoFgHACK = { fg = colors.mauve },
          TodoBgHACK = { fg = colors.mantle, bg = colors.mauve, style = { "bold" } },
          TodoFgWARN = { fg = colors.red },
          TodoBgWARN = { fg = colors.mantle, bg = colors.red, style = { "bold" } },
          TodoFgNOTE = { fg = colors.blue },
          TodoBgNOTE = { fg = colors.mantle, bg = colors.blue, style = { "bold" } },
          TodoFgTEST = { fg = colors.sapphire },
          TodoBgTEST = { fg = colors.mantle, bg = colors.sapphire, style = { "bold" } },
        }
      end,
    },
    integrations = {
      noice = true,
    },
  },
}
