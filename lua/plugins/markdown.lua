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
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = true,
    ft = "markdown",
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/dev/notes/",
        },
      },
      ui = { enable = false },
    },
  },
  { "lukas-reineke/headlines.nvim", enabled = false, dependencies = "nvim-treesitter/nvim-treesitter" },
  { "mfussenegger/nvim-lint", enabled = false },
}
