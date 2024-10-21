local wk = require("which-key")
wk.add({
  { "<leader>o", icon = "󰒍", group = "misc options", desc = "misc options" },
})

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = function(ctx)
      return ctx.plugin and 0 or 1000
    end,
  },
}
