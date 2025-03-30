return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<leader>:", function() Snacks.picker.command_history({ layout = "select" }) end, desc = "Command history" },
      { "<leader>sc", function() Snacks.picker.command_history({ layout = "select" }) end, desc = "Command history" },
      { "<leader>si", function() Snacks.picker.icons({ layout = "select" }) end, desc = "Icons" },
      { "<leader>sk", function() Snacks.picker.keymaps({ layout = "ivy_split" }) end, desc = "keymaps" },
      { "<leader>/", function() Snacks.picker.grep({ layout = "ivy_split" }) end, desc = "Grep" },
      { "<leader>oR", function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>,", function () Snacks.picker.buffers({ layout = "ivy_split" }) end, desc = "Buffers" }
    },
    opts = function(_, opts)
      ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
      local progress = vim.defaulttable()
      vim.api.nvim_create_autocmd("LspProgress", {
        ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
          if not client or type(value) ~= "table" then
            return
          end
          local p = progress[client.id]

          for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
              p[i] = {
                token = ev.data.params.token,
                msg = ("[%3d%%] %s%s"):format(
                  value.kind == "end" and 100 or value.percentage or 100,
                  value.title or "",
                  value.message and (" **%s**"):format(value.message) or ""
                ),
                done = value.kind == "end",
              }
              break
            end
          end

          local msg = {} ---@type string[]
          progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
          end, p)

          local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
          vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
              notif.icon = #progress[client.id] == 0 and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
          })
        end,
      })

      opts.bigfile = { enabled = true }
      opts.indent = { enabled = false }
      opts.words = { enabled = true }
      opts.statuscolumn = { enabled = false }
      opts.notifier = { enabled = true, timeout = 4000, top_down = true, style = "compact" }
      opts.styles = { lazygit = { width = 0, height = 0 } }
      opts.styles["input"] = {
        relative = "cursor",
        row = -3,
        col = 0,
        width = 40,
        keys = { i_esc = { "<esc>", "stopinsert", mode = "i" } },
      }
      opts.terminal.win.wo = { winbar = "" } -- Disables title bar in terminal
      opts.picker = {
        layout = {
          preset = "telescope",
        },
        sources = {
          explorer = {
            hidden = true,
            layout = { layout = { preset = "sidebar", preview = false, position = "right" } },
            win = {
              list = {
                -- Enables you to pick where to open your file if you have splits
                keys = { ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } } },
              },
            },
          },
          notifications = {
            actions = {
              ---@diagnostic disable-next-line: undefined-field
              yank_msg = function(_, item, action)
                vim.fn.setreg(action.reg or vim.v.register, item.item.msg)
              end,
            },
            confirm = { "yank_msg", "close" },
          },
        },
        layouts = {
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.9,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                -- stylua: ignore
                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              },
              { win = "preview", title = "{preview:Preview}", width = 0.65, border = "rounded", title_pos = "center" },
            },
          },
          vtelescope = {
            reverse = true,
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0.85,
              height = 0.9,
              border = "none",
              { win = "preview", height = 0.65, title = "{preview:Preview}", border = "rounded", title_pos = "center" },
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                -- stylua: ignore
                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              },
            },
          },
          ivy_split = {
            preview = "main",
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.3,
              position = "bottom",
              border = "top",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", width = 0.6, border = "left" },
              },
            },
          },
        },
      }
      opts.styles["terminal"] = { height = 0.2 }
      opts.styles["notification_history"] = { width = 0.9, height = 0.7 }
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
      opts.views = {
        -- Bigger fonts
        cmdline_popup = { position = { row = 30, col = "50%" } },
        cmdline_popupmenu = { position = { row = 33, col = "50%" } },
        -- Regular fonts
        -- cmdline_popup = { position = { row = 35, col = "50%" } },
        -- cmdline_popupmenu = { position = { row = 38, col = "50%" } },
        mini = { win_options = { winblend = 0 } },
      }
      opts.lsp = { progress = { enabled = false }, hover = { silent = true } }
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
        { filter = { event = "msg_show", find = "%d lines indented" } },
        { filter = { event = "msg_show", find = "%d lines moved" } },
        { filter = { event = "msg_show", find = "<ed" } },
        { filter = { event = "msg_show", find = ">ed" } },
        { filter = { event = "lsp", kind = "progress", find = "jdtls" } },
      }
    end,
  },
}
