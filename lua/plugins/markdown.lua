return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    -- Background of headlines is annoying
    opts = {
      heading = {
        enabled = false,
      },
    },
  },
  { "lukas-reineke/headlines.nvim", enabled = false, dependencies = "nvim-treesitter/nvim-treesitter" },
  { "mfussenegger/nvim-lint", enabled = false },
}
