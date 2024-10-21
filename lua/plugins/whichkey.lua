return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.preset = "helix"
    opts.delay = function(ctx)
      return ctx.plugin and 0 or 1000
    end
    return opts
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      {
        "<leader>o",
        icon = { icon = "", color = "yellow" },
        group = "misc options",
        desc = "misc options",
      },
      {
        "<leader>ol",
        icon = { icon = "󰒍", color = "red" },
      },
    })
  end,
}
