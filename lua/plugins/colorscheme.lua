-- :Inspect and see highlights
-- <leader>sH gives you a picker with all the current highlights

return {
  require("plugins.colorschemes.tokyonight"),
  require("plugins.colorschemes.rose-pine"),
  require("plugins.colorschemes.oldworld"),
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "oldworld",
      colorscheme = "rose-pine",
      -- colorscheme = "tokyonight",
    },
  },
}
