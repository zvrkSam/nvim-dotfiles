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
    { "g1", "<cmd>Glance definitions<cr>", desc = "Glance definitions" },
    { "g2", "<cmd>Glance references<cr>", desc = "Glance references" },
    { "g3", "<cmd>Glance type_definitions<cr>", desc = "Glance type_definitions" },
    { "g4", "<cmd>Glance implementations<cr>", desc = "Glance implementations" },
  },
}
