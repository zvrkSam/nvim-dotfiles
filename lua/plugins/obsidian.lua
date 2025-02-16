return {
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
}
