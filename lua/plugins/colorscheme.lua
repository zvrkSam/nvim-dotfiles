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
      styles = { -- You can pass the style using the format: style = true
        comments = { italic = false }, -- style for comments
        keywords = { italic = false }, -- style for keywords
        identifiers = { italic = false }, -- style for identifiers
        functions = { italic = false }, -- style for functions
        variables = { italic = false }, -- style for variables
        booleans = { italic = false }, -- style for booleans
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
