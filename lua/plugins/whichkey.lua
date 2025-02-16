return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.preset = "helix"
    -- opts.icons = { mappings = false }
    opts.delay = function(ctx)
      return ctx.plugin and 0 or 1000
    end
    return opts
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>o", group = "misc options", desc = "misc options", icon = { icon = "", color = "yellow" } },
      { "<leader>oc", icon = { icon = "", color = "grey" } },
      { "<leader>ol", icon = { icon = "󰒍", color = "red" } },
      { "<leader>oo", icon = { icon = "󰖟", color = "azure" } },
      { "<leader>os", icon = { icon = "󰊕", color = "azure" } },
      { "<leader>t", group = "Terminal", icon = { icon = "", color = "red" } },
      { "<leader>j", group = "Neogit/Lazygit", icon = { icon = "", color = "azure" } },
      { "<leader>L", group = "Lazy" },
      { "<leader>n", group = "Notes/Markdown", icon = { icon = "󱓧", color = "grey" } },
      { "<leader>h", group = "hunks", icon = { icon = "󰊢", color = "red" } },
    })
  end,
}
