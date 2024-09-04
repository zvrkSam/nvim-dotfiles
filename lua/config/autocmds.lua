-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

local function create_telescope_command(command_name, file_pattern, prompt_title)
  vim.api.nvim_create_user_command(command_name, function()
    require("telescope.builtin").find_files({
      find_command = { "rg", "--files", "--glob", file_pattern },
      prompt_title = prompt_title,
    })
  end, {})
end

create_telescope_command("TelescopeGo", "*.go", "Find golang Files")
create_telescope_command("TelescopeMD", "*.md", "Find markdown Files")
create_telescope_command("TelescopeMDX", "*.mdx", "Find mdx Files")
create_telescope_command("TelescopeTSX", "*.tsx", "Find tsx Files")
create_telescope_command("TelescopeTS", "*.ts", "Find ts Files")
create_telescope_command("TelescopeAstro", "*.astro", "Find astro Files")
