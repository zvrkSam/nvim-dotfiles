return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function(_, opts)
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "snacks_terminal",
          size = { height = 0.4 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end

      opts.bigfile = { enabled = true }
      opts.notifier = {
        enabled = true,
        timeout = 4000,
        top_down = true,
        style = "compact", -- compact, minimal, fancy
      }
      opts.words = {
        enabled = true,
      }
      opts.styles = {
        -- make lazygit fullscreen
        lazygit = {
          width = 0,
          height = 0,
        },
      }
      opts.styles["notification.history"] = {
        width = 0.9,
      }
      opts.statuscolumn = {
        enabled = true,
      }
      Snacks.config.style("news", {
        border = "rounded",
        width = 0.8,
        height = 0.7,
      })
      opts.win = {
        style = "news",
        border = "single",
      }
      opts.win = {
        style = "terminal",
        height = 0.2,
        keys = {
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand("<cfile>"))
            if f == "" then
              Snacks.notify.warn("No file under cursor")
            else
              self:close()
              vim.cmd("e " .. f)
            end
          end,
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd("stopinsert")
              else
                self.esc_timer:start(200, 0, function() end)
                return "<esc>"
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
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

      opts.presets.lsp_doc_border = true

      opts.views = {
        cmdline_popup = {
          position = {
            row = 35,
            col = "50%",
          },
        },
        cmdline_popupmenu = {
          position = {
            row = 38,
            col = "50%",
          },
        },
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      }

      opts.lsp = {
        hover = {
          silent = true,
        },
      }

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
