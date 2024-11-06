-- tokyonight
local tn = {
  indigo = "#7F85FF", -- for transparent background (abit more darker)
  -- indigo = "#878DFF" -- for non transparent background
  pink = "#F570D9",
  purple = "#9270D0",
  darker_purple = "#9C65FF",
  visible_gray = "#70728D",
  bracket_gray = "#9BA5D5",
  gutter = "#555D82",
}

local stn = {
  bg = "#24283B",
  bg_dark = "#1F2335",
}

-- catppuccin
local cat = {
  teal = "#FAE3B0",
  lav = "#AB9DFD",
  purple = "#9684FC",
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
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
      on_colors = function(colors)
        colors.green1 = tn.indigo
        colors.purple = tn.purple
        colors.blue5 = tn.pink
        colors.bg_statusline = colors.none -- makes lualine transparent
        colors.git.add = colors.green
        colors.git.change = colors.yellow
        colors.git.delete = colors.red
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.magenta })
      end,
      on_highlights = function(hl, c)
        hl.Visual = { bg = c.bg_highlight, bold = true }
        hl.LineNrAbove = { fg = tn.gutter }
        hl.LineNrBelow = { fg = tn.gutter }
        hl["@tag.delimiter"] = { fg = tn.darker_purple }
        -- hl.Label = { fg = c.blue5 }
        hl["@tag.tsx"] = { fg = tn.darker_purple }
        hl["@punctuation.delimiter"] = { fg = c.fg }
        hl["@punctuation.bracket"] = { fg = tn.bracket_gray }
        hl["@variable.builtin"] = { fg = c.red }
        -- hl["@keyword.import"] = { fg = c.magenta }
        hl.WinSeparator = { fg = c.purple }
        hl.FloatBorder = { fg = tn.indigo }
        hl.FloatTitle = { fg = c.green }
        hl.DiagnosticUnnecessary = { fg = tn.visible_gray }
        hl.RenderMarkdownCode = { bg = c.bg_highlight }
        hl.WhichKeyTitle = { fg = c.green }
        hl.WhichKeyBorder = { fg = tn.indigo }
        hl.TelescopeBorder = { fg = tn.indigo }
        hl.TelescopeTitle = { fg = c.green }
        hl.TelescopeSelection = { fg = c.purple, bold = true }
        hl.TelescopeMatching = { fg = c.green, bold = true }
        hl.Macro = { fg = tn.indigo }
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
        hl.BlinkCmpMenu = { bg = stn.bg_dark }
        hl.BlinkCmpMenuBorder = { fg = tn.indigo, bg = c.none }
        hl.BlinkCmpDocBorder = { fg = tn.indigo }
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
    "catppuccin/nvim",
    name = "catppuccin",
    -- enabled = false,
    lazy = true,
    opts = {
      flavour = "frappe", -- latte, frappe (when alacritty is transparent), macchiato, mocha
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
            NoiceCmdlinePopupTitle = { fg = colors.mauve, style = { "bold" } },
            NoiceCmdlineIcon = { fg = colors.mauve },
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
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    enabled = false,
    lazy = true,
    opts = {
      -- dark (default) | darker (best) | cool | deep | warm | warmer
      style = "darker",
      transparent = true,
      ending_tildes = false,
      -- toggle_style_key = "<leader>od",
      -- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" },
      code_style = {
        comments = "none",
      },
      lualine = {
        transparent = true,
      },
    },
  },
  {
    -- Setup instructions
    -- https://github.com/projekt0n/github-nvim-theme
    -- there is a lualine instructions too
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    enabled = false,
    lazy = true,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "onedark",
      -- colorscheme = "github_dark_default",
    },
  },
}
