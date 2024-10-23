return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = {
            { fg = "#7aa2f7" },
          },
        },
        indent = {
          enable = true,
          chars = { "┊" },
        },
      })
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    enabled = false,
  },
}
