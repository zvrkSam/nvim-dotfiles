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
    keys = {
      {
        "gx",
        function()
          -- Save current position
          local save_cursor = vim.api.nvim_win_get_cursor(0)

          -- Search for http:// or https:// on the current line
          local line = vim.api.nvim_get_current_line()
          local url_start = line:find("https?://")

          if url_start then
            -- Move cursor to the start of the URL
            vim.api.nvim_win_set_cursor(0, { save_cursor[1], url_start - 1 })
            -- Fire Browse command
            vim.cmd("Browse")
          end

          -- Restores cursor position
          vim.api.nvim_win_set_cursor(0, save_cursor)
        end,
        mode = { "n", "x" },
      },
    },
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
