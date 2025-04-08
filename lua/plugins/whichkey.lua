-- Overriding default keymap groups | delete
-- https://github.com/LazyVim/LazyVim/discussions/1427#discussioncomment-11460296

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
    opts.defaults['<leader>s"'] = nil
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>t", group = "Terminal", icon = { icon = "", color = "red" } },
      { "<leader>C", icon = { icon = "", color = "cyan" } },
      { "<leader>F", icon = { icon = "󰖟", color = "azure" } },
      { "<leader>j", group = "Neogit/Lazygit", icon = { icon = "", color = "azure" } },
      { "<leader>L", group = "Lazy" },
      { "<leader>n", group = "Notes/Markdown", icon = { icon = "󱓧", color = "grey" } },
      { "<leader>h", group = "hunks", icon = { icon = "󰊢", color = "red" } },
      { "<leader>o", group = "misc commands", desc = "misc options", icon = { icon = "", color = "green" } },
      { "<leader>O", group = "documentation", desc = "doc commands", icon = { icon = "󱔗", color = "blue" } },
      { "<leader>Oc", icon = { icon = "", color = "grey" } },
      { "<leader>Og", icon = { icon = "", color = "blue" } },
      { "<leader>Op", icon = { icon = "", color = "yellow" } },
      { "<leader>oF", icon = { icon = "", color = "blue" } },
      { "<leader>oD", icon = { icon = "󰕮", color = "cyan" } },
      { "<leader>oS", icon = { icon = "", color = "azure" } },
      { "<leader>oR", icon = { icon = "", color = "cyan" } },
      { "<leader>or", icon = { icon = "󰒍", color = "red" } },
      { "<leader>ox", icon = { icon = "", color = "azure" } },
      { "<leader>oo", icon = { icon = "󰽐", color = "cyan" } },
      { "<leader>om", icon = { icon = "❌", color = "red" } },
      { "<leader>oy", icon = { icon = "󰐒", color = "cyan" } },
      { "<leader>fa", icon = { icon = "", color = "orange" } },
      { "<leader>fg", icon = { icon = "", color = "azure" } },
      { "<leader>ft", icon = { icon = "", color = "blue" } },
      { "<leader>fT", icon = { icon = "", color = "blue" } },
      { "<leader>gd", icon = { icon = "", color = "azure" } },
      { "<leader>nn", icon = { icon = "", color = "grey" } },
      { "<leader>nN", icon = { icon = "", color = "grey" } },
      { "<leader>fm", icon = { icon = "", color = "grey" } },
      { "<leader>fM", icon = { icon = "", color = "grey" } },
      { "g1", icon = { icon = "", color = "yellow" } },
      { "g2", icon = { icon = "", color = "yellow" } },
      { "g3", icon = { icon = "", color = "yellow" } },
      { "g4", icon = { icon = "", color = "yellow" } },
    })
  end,
}
