-- :Inspect and see highlights
-- <leader>sH gives you a picker with all the current highlights

return {
  require("plugins.colorschemes.tokyonight"),
  require("plugins.colorschemes.rose-pine"),
  {
    "dgox16/oldworld.nvim",
    enabled = false,
    opts = {
      variant = "oled", -- default, oled, cooler
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        identifiers = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        booleans = { italic = false },
      },
    },
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    enabled = false,
    lazy = true,
    opts = {
      transparent = true,
      dimInactive = false,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      functionStyle = { italic = false },
      typeStyle = { italic = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "oldworld",
      -- colorscheme = "kanagawa-paper",
      colorscheme = "rose-pine",
      -- colorscheme = "tokyonight",
    },
  },
}
