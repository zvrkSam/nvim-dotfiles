-- :!open <your-link-here>
-- g+x to open link on that line
return {
  {
    "dhruvmanila/browser-bookmarks.nvim",
  },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },
}
