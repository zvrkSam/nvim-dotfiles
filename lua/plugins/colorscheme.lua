-- tokyonight - night
local tn = {
  pure_black = "#000000",
  indigo = "#7F85FF", -- for transparent background (abit more darker)
  -- indigo = "#878DFF" -- for non transparent background
  winseparator = "#4B4D83",
  pink = "#F570D9",
  purple = "#9270D0",
  darker_purple = "#9C65FF",
  visible_gray = "#70728D",
  bracket_gray = "#9AA6DF",
  gutter = "#555D82",
  comment = "#5C6693",
  white = "#F4F5FF",
}

-- tokyonight - storm
local tns = {
  bg = "#24283B",
  bg_dark = "#1F2335",
}

-- :Inspect and see highlights
-- :Telescope highlights to see all of the highlights
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
      -- list of all the colors for tokyonight
      -- https://github.com/folke/tokyonight.nvim/discussions/453
      on_colors = function(c)
        c.green1 = tn.indigo
        c.purple = tn.purple
        c.blue5 = tn.pink
        c.bg_statusline = c.none -- makes lualine transparent
        c.git.add = c.green
        c.git.change = c.yellow
        c.git.delete = c.red
      end,
      on_highlights = function(hl, c)
        hl.Visual = { bg = c.bg_highlight, bold = true }
        hl.Comment = { fg = tn.comment }
        hl.Macro = { fg = tn.indigo }
        hl.DiagnosticUnnecessary = { fg = tn.visible_gray }
        hl.RenderMarkdownCode = { bg = c.bg_highlight }
        hl["@tag.delimiter"] = { fg = tn.darker_purple }
        hl["@tag.tsx"] = { fg = tn.darker_purple }
        hl["@punctuation.delimiter"] = { fg = c.fg }
        hl["@punctuation.bracket"] = { fg = tn.bracket_gray }
        hl["@variable.builtin"] = { fg = c.red }

        -- GitSigns
        hl.GitSignsAdd = { fg = c.green, bold = true }
        hl.GitSignsChange = { fg = c.yellow, bold = true }
        hl.GitSignsDelete = { fg = c.red, bold = true }

        -- Flash
        hl.FlashMatch = { bg = tn.darker_purple, fg = tn.white }

        -- UI
        hl.TreesitterContextLineNumber = { fg = c.fg, bold = true }
        hl.LineNrAbove = { fg = tn.gutter }
        hl.LineNrBelow = { fg = tn.gutter }
        hl.WinSeparator = { fg = tn.winseparator }
        hl.FloatBorder = { fg = tn.indigo }
        hl.FloatTitle = { fg = c.green }

        -- WhichKey
        hl.WhichKeyTitle = { fg = c.green }
        hl.WhichKeyBorder = { fg = tn.indigo }

        -- Fzf-lua / Telescope
        hl.FzfLuaBorder = { fg = tn.indigo }
        hl.FzfLuaTitle = { fg = c.orange }
        hl.FzfLuaPreviewTitle = { fg = c.green }
        hl.FzfLuaFzfMatch = { fg = tn.pink, bold = true }
        hl.FzfLuaFzfPrompt = { fg = tn.indigo, bold = true }
        hl.TelescopeBorder = { fg = tn.indigo }
        hl.TelescopeTitle = { fg = c.green }
        hl.TelescopeSelection = { fg = c.purple, bold = true }
        hl.TelescopeMatching = { fg = c.green, bold = true }
        hl.TreesitterContext = { bg = c.none }

        -- Noice
        hl.NoiceCmdlineIcon = { fg = tn.indigo }
        hl.NoiceCmdlinePopupBorder = { fg = tn.indigo }
        hl.NoicePopupmenuSelected = { fg = c.red, bold = true }
        hl.NoicePopupmenuMatch = { fg = tn.indigo }
        hl.NoiceMini = { fg = c.purple }
        hl.NoiceFormatProgressDone = { bg = c.green, fg = c.bg }
        hl.NoiceFormatProgressTodo = { bg = c.purple, fg = c.bg }
        hl.NoiceLspProgressSpinner = { fg = c.green }
        hl.NoiceLspProgressTitle = { fg = c.green }
        hl.NoiceLspProgressClient = { fg = c.purple }
        hl.NoiceCmdlinePopupTitleCmdline = { fg = c.green }
        hl.NoiceConfirmBorder = { fg = tn.indigo }

        -- BlinkCmp
        hl.BlinkCmpMenu = { bg = c.bg }
        hl.BlinkCmpMenuBorder = { fg = tn.indigo, bg = c.none }
        hl.BlinkCmpMenuSelection = { fg = tn.pink }
        hl.BlinkCmpDocBorder = { fg = tn.indigo }
        hl.BlinkCmpLabelMatch = { fg = tn.indigo }

        -- Snacks
        hl.SnacksDashboardHeader = { fg = c.magenta }
        hl.SnacksDashboardFooter = { fg = c.magenta }
        hl.SnacksDashboardTitle = { fg = tn.purple }
        hl.SnacksDashboardIcon = { fg = c.magenta }
        hl.SnacksDashboardDesc = { fg = c.green1 }
        hl.SnacksDashboardSpecial = { fg = c.green }
        hl.SnacksDashboardDir = { fg = tn.winseparator }
        hl.SnacksDashboardFile = { fg = c.green }

        -- Todo
        hl.TodoFgTODO = { fg = c.yellow }
        hl.TodoBgTODO = { fg = c.bg_dark, bg = c.yellow, bold = true }
        hl.TodoFgTEST = { fg = c.blue1 }
        hl.TodoBgTEST = { fg = c.bg_dark, bg = c.blue1, bold = true }
        hl.TodoFgWARN = { fg = c.red }
        hl.TodoBgWARN = { fg = c.bg_dark, bg = c.red, bold = true }
        hl.TodoFgHACK = { fg = tn.pink }
        hl.TodoBgHACK = { fg = c.bg_dark, bg = tn.pink, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
