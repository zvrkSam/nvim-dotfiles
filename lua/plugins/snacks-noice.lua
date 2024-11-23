return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function(_, opts)
      opts.bigfile = { enabled = true }
      opts.words = { enabled = true }
      opts.statuscolumn = { enabled = true }
      opts.notifier = { enabled = true, timeout = 4000, top_down = true, style = "compact" }
      opts.styles = { lazygit = { width = 0, height = 0 } }
      opts.styles["terminal"] = { height = 0.2 }
      opts.styles["notification.history"] = { width = 0.9 }
      opts.styles["news"] = { border = "rounded", width = 0.8, height = 0.7 }
      opts.dashboard = {
        preset = {
          header = [[
            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]],
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "markdown",
      --   callback = function(event)
      --     vim.schedule(function()
      --       require("noice.text.markdown").keys(event.buf)
      --     end)
      --   end,
      -- })

      opts.views = {
        cmdline_popup = { position = { row = 35, col = "50%" } },
        cmdline_popupmenu = { position = { row = 38, col = "50%" } },
        mini = { win_options = { winblend = 0 } },
      }
      opts.lsp = { hover = { silent = true } }
      opts.presets.lsp_doc_border = true

      -- Suppresing notifications
      opts.routes = {
        { filter = { event = "msg_show", find = "written" } },
        { filter = { event = "msg_show", find = "yanked" } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" } },
        { filter = { event = "msg_show", find = "; after #%d+" } },
        { filter = { event = "msg_show", find = "; before #%d+" } },
        { filter = { event = "msg_show", find = "%d fewer lines" } },
        { filter = { event = "msg_show", find = "%d more lines" } },
        { filter = { event = "msg_show", find = "<ed" } },
        { filter = { event = "msg_show", find = ">ed" } },
        { filter = { event = "lsp", kind = "progress", find = "jdtls" } },
      }
    end,
  },
}
