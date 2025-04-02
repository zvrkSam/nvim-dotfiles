-- Tips on how to improve virtual_lines and inline diagnostics
-- https://www.reddit.com/r/neovim/comments/1jpbc7s/disable_virtual_text_if_there_is_diagnostic_in/
-- https://www.reddit.com/r/neovim/comments/1jo9oe9/i_set_up_my_config_to_use_virtual_lines_for/
--
-- Disabled due to constant layout shifting
-- Virtual lines
-- vim.diagnostic.config({ virtual_lines = true })

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        -- virtual_text = false, -- Inline diagnostics
        float = {
          border = "rounded",
          source = "always",
        },
      },
      servers = {
        -- For the time being templ is removed
        -- templ = {},
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
}

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
