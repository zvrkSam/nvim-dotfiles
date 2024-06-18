return {
  "nvim-lualine/lualine.nvim",
  -- enabled = false,
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- vim.o.laststatus = vim.g.lualine_laststatus

    -- local harpoon = require("harpoon.")
    --
    -- local function harpoon_component()
    --   local total_marks = harpoon.get_lenght()
    --
    --   if total_marks == 0 then
    --     return ""
    --   end
    --
    --   local current_mark = "-"
    --
    --   local mark_idx = harpoon.get_current_index()
    --   if mark_idx ~= nil then
    --     current_mark = tostring(mark_idx)
    --   end
    --
    --   return string.format(" %s%d", current_mark, total_marks)
    -- end

    return {
      options = {
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch" },
          {
            "diff",
            -- symbols = {
            --   added = icons.git.added,
            --   modified = icons.git.modified,
            --   removed = icons.git.removed,
            -- },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          {
            "diagnostics",
            -- symbols = {
            --   error = icons.diagnostics.Error,
            --   warn = icons.diagnostics.Warn,
            --   info = icons.diagnostics.Info,
            --   hint = icons.diagnostics.Hint,
            -- },
          },
        },
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path(), separator = "" },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = LazyVim.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = LazyVim.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = LazyVim.ui.fg("Special"),
          },
          -- { "location", separator = ":", padding = { left = 0, right = 0 }, color = LazyVim.ui.fg("Statement") },
          -- { "progress", separator = "|", padding = { left = 0, right = 1 }, color = LazyVim.ui.fg("Statement") },
          -- harpoon_component(),
          -- stylua: ignore
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = LazyVim.ui.fg("Statement"),
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
