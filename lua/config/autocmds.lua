-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_user_command("TelescopeLua", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--glob", "*.lua" },
    prompt_title = "Find Lua Files",
  })
end, {})

vim.api.nvim_create_user_command("TelescopeGo", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--glob", "*.go" },
    prompt_title = "Find Go Files",
  })
end, {})

vim.api.nvim_create_user_command("TelescopeMD", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--glob", "*.md" },
    prompt_title = "Find Markdown Files",
  })
end, {})

vim.api.nvim_create_user_command("TelescopeMDX", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--glob", "*.mdx" },
    prompt_title = "Find MDX Files",
  })
end, {})

vim.api.nvim_create_user_command("TelescopeAstro", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--glob", "*.astro" },
    prompt_title = "Find Astro Files",
  })
end, {})
