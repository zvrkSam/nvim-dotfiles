local rp = {
  base = "#232136",
  surface = "#2a273f",
  overlay = "#393552",
  muted = "Muted",
  subtle = "Subtle",
  text = "Text",
  love = "Love",
  gold = "Gold",
  rose = "Rose",
  pine = "Pine",
  foam = "#9FDBE6",
  iris = "Iris",
  highlight_low = "#2a283e",
  highlight_high = "#56526e",
}

return {
  "rose-pine/neovim",
  -- enabled = false,
  name = "rose-pine",
  lazy = true,
  opts = {
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "moon",
    styles = {
      italic = false,
      transparency = true,
    },
    palette = {
      moon = {
        foam = rp.foam,
      },
    },
    highlight_groups = {
      -- Code
      Visual = { bg = rp.overlay, bold = true },
      LspReferenceRead = { bg = rp.base },

      -- UI
      FloatTitle = { fg = rp.love },
      TreesitterContextLineNumber = { fg = rp.text, bold = true },

      -- Snacks
      SnacksNotifierBorderInfo = { fg = rp.pine },
      SnacksNotifierIconInfo = { fg = rp.pine },
      SnacksNotifierTitleInfo = { fg = rp.pine },
      SnacksNotifierFooterInfo = { fg = rp.pine },
      SnacksNotifierHistoryTitle = { fg = rp.pine },
      SnacksNotifierHistoryDateTime = { fg = rp.pine },

      -- Dashboard
      SnacksDashboardHeader = { fg = rp.iris },
      SnacksDashboardFooter = { fg = rp.iris },
      SnacksDashboardTitle = { fg = rp.pine },
      SnacksDashboardIcon = { fg = rp.rose },
      SnacksDashboardDesc = { fg = rp.love },
      SnacksDashboardSpecial = { fg = rp.rose },
      SnacksDashboardDir = { fg = rp.subtle },
      SnacksDashboardFile = { fg = rp.love },

      -- Noice
      NoiceCmdlineIcon = { fg = rp.love },
      NoiceCmdlinePopupBorder = { fg = rp.muted },
      NoiceCmdlinePopupTitleCmdline = { fg = rp.love },
      NoiceCmdlinePopupTitleFilter = { fg = rp.love },
      NoiceCmdlinePopupTitleLua = { fg = rp.pine },
      NoicePopupmenuSelected = { fg = rp.pine, bold = true },
      NoicePopupmenuMatch = { fg = rp.rose },

      -- GitSigns
      CursorLineNr = { fg = rp.iris, bold = true },
      GitSignsAdd = { fg = rp.pine, bold = true },
      GitSignsChange = { fg = rp.rose, bold = true },
      GitSignsDelete = { fg = rp.love, bold = true },

      -- WhichKey
      WhichKeyTitle = { fg = rp.love },

      -- Todo
      TodoFgTODO = { fg = rp.gold },
      TodoBgTODO = { fg = rp.base, bg = rp.gold, bold = true },
      TodoFgWARN = { fg = rp.love },
      TodoBgWARN = { fg = rp.base, bg = rp.love, bold = true },
      TodoFgHACK = { fg = rp.iris },
      TodoBgHACK = { fg = rp.base, bg = rp.iris, bold = true },
      TodoFgNOTE = { fg = rp.rose },
      TodoBgNOTE = { fg = rp.base, bg = rp.rose, bold = true },
      TodoFgTEST = { fg = rp.iris },
      TodoBgTEST = { fg = rp.base, bg = rp.iris, bold = true },
    },
  },
}
