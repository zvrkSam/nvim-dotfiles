return {
  -- alternative to render-markdown https://github.com/OXY2DEV/markview.nvim?tab=readme-ov-file
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        width = "block",
      },
    },
  },
  { "lukas-reineke/headlines.nvim", enabled = false, dependencies = "nvim-treesitter/nvim-treesitter" },
  { "mfussenegger/nvim-lint", enabled = false },
}
