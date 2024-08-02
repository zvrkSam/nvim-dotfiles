-- templ specific commands
-- local templ_format = function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local filename = vim.api.nvim_buf_get_name(bufnr)
--   local cmd = "templ fmt " .. vim.fn.shellescape(filename)
--
--   vim.fn.jobstart(cmd, {
--     on_exit = function()
--       -- Reload the buffer only if it's still the current buffer
--       if vim.api.nvim_get_current_buf() == bufnr then
--         vim.cmd("e!")
--       end
--     end,
--   })
-- end
--
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })
-- vim.filetype.add({ extension = { templ = "templ" } })

return {
  {
    "garymjr/nvim-snippets",
    keys = {
      {
        "<Tab>",
        function()
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return
          end
          return "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<Tab>",
        function()
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end,
        expr = true,
        silent = true,
        mode = "s",
      },
      {
        "<S-Tab>",
        function()
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
            return
          end
          return "<S-Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        signs = false,
      },
      servers = {
        templ = {},
        astro = {},
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        prettier = {
          prepend_args = { "--single-quote" },
        },
      },
    },
  },
}
