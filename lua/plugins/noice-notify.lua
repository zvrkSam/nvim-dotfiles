return {
  -- notify

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      stages = "static",
      -- default | minimal | simple | compact | wrapped-compact
      render = "compact",
      top_down = true,
      timeout = 4000,
    },
    -- This is only for onedark theme
    -- config = function()
    --   require("notify").setup({
    --     background_colour = "#000000",
    --   })
    -- end,
  },

  -- noice

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      local focused = true

      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })

      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true

      -- This is my part
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

      opts.messages = {
        -- Disables info messages
        view = false,
      }

      opts.routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "jdtls",
          },
          opts = { skip = true },
        },
      }
    end,
  },
}
