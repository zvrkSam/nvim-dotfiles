return {
  -- notify

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      -- default | minimal | simple | compact | wrapped-compact
      -- render = "wrapped-compact",
      -- stages = "static",
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
