return {
  { "lukas-reineke/headlines.nvim", enabled = false, dependencies = "nvim-treesitter/nvim-treesitter" },
  { "mfussenegger/nvim-lint", enabled = false },
  {
    "MeanderingProgrammer/markdown.nvim",
    enabled = false,
    -- Background of headlines is annoying
    opts = {
      heading = {
        enabled = false,
      },
    },
  },
}
