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
  opts = function(_, opts)
    -- Function to get the number of open buffers using the :ls command
    local function get_buffer_count()
      local buffers = vim.fn.execute("ls")
      local count = 0
      -- Match only lines that represent buffers, typically starting with a number followed by a space
      for line in string.gmatch(buffers, "[^\r\n]+") do
        if string.match(line, "^%s*%d+") then
          count = count + 1
        end
      end
      return count
    end

    local function is_picker_open()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "snacks_layout_box" then
          return true
        end
      end
      return false
    end

    -- Lualine component for buffer count
    local buffer_count = function()
      if is_picker_open() then
        return ""
      end
      return string.format(" %s", get_buffer_count())
    end

    local colors = require("tokyonight.colors").setup()

    opts.options = {
      --        
      -- section_separators = { left = "", right = "" },
      -- │ ┊    
      -- component_separators = { left = "", right = "" },
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
      refresh = {
        statusline = 300,
      },
    }
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch" },
        { "diff" },
        { "diagnostics" },
        -- stylua: ignore
        -- {
        --   function() return require("noice").api.status.command.get() end,
        --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        --   color = LazyVim.ui.fg("Statement"),
        -- },
      },
      lualine_c = {
        {
          function()
            local arrow = require("arrow.statusline")
            local text = arrow.text_for_statusline()
            local is_on_arrow = arrow.is_on_arrow_file()
            local icon = "󰸖"

            if (text and text ~= "") or is_on_arrow then
              return icon .. " " .. (text or "")
            else
              return ""
            end
          end,
          color = { fg = colors.green },
          -- separator = "",
          separator = "",
          padding = { left = 1, right = 0 },
        },
        {
          buffer_count,
          separator = "",
          color = { fg = colors.blue },
          padding = { left = 1, right = 0 },
        },
        -- LazyVim.lualine.root_dir(),
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path(), padding = { left = -1 }, separator = "" },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { Snacks.util.color("Debug") }end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { Snacks.util.color("Special") } end,
        },
      },
      lualine_x = {},
      lualine_y = {
        -- { "location" },
      },
      lualine_z = {},
    }
    opts.extensions = { "neo-tree", "lazy" }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    -- if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
    --   local trouble = require("trouble")
    --   local symbols = trouble.statusline({
    --     mode = "symbols",
    --     groups = {},
    --     title = false,
    --     filter = { range = true },
    --     format = "{kind_icon}{symbol.name:Normal}",
    --     hl_group = "lualine_c_normal",
    --   })
    --   table.insert(opts.sections.lualine_c, {
    --     symbols and symbols.get,
    --     cond = function()
    --       return vim.b.trouble_lualine ~= false
    --         and symbols.has()
    --         and vim.bo.filetype ~= "astro"
    --         and vim.bo.filetype ~= "markdown"
    --     end,
    --   })
    -- end
  end,
}
