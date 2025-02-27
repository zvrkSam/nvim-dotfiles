-- :!open <your-link-here>
-- g+x to open link on that line
return {
  {
    -- TODO: make a better plugin then this
    "dhruvmanila/browser-bookmarks.nvim",
    enabled = false,
    event = "VeryLazy",
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    config = function()
      require("gx").setup({
        open_browser_app = "xdg-open",
        handlers = { go = true },
        handler_options = { search_engine = "https://search.brave.com/search?q=" },
      })
    end,
  },
}
