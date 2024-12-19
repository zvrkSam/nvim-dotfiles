return {
  "DNLHC/glance.nvim",
  event = "LazyFile",
  config = true,
  opts = {
    border = {
      enable = true,
    },
  },
  keys = {
    { "g1", "<cmd>Glance definitions<cr>", desc = "Goto Definitions (Glance)" },
    { "g2", "<cmd>Glance references<cr>", desc = "Goto References (Glance)" },
  },
}
