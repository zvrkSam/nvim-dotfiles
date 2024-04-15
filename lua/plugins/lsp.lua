-- templ specific commands
local templ_format = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local cmd = "templ fmt " .. vim.fn.shellescape(filename)

  vim.fn.jobstart(cmd, {
    on_exit = function()
      -- Reload the buffer only if it's still the current buffer
      if vim.api.nvim_get_current_buf() == bufnr then
        vim.cmd("e!")
      end
    end,
  })
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })
vim.filetype.add({ extension = { templ = "templ" } })

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern("go.work", "go.mod", ".git")(...)
          -- end,
        },
        astro = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(...)
          -- end,
        },
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
