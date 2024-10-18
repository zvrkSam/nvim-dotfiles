-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "json" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

--- Buffers ---

local function delete_all_buffers(command_name)
  vim.api.nvim_create_user_command(command_name, function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()

    for _, i in ipairs(bufs) do
      if i ~= current_buf then
        vim.api.nvim_buf_delete(i, {})
      end
    end
  end, {})
end

--- Telescope ---

local telescope = require("telescope.builtin")

local function search_by_file_type(command_name, file_pattern, prompt_title)
  vim.api.nvim_create_user_command(command_name, function()
    telescope.find_files({
      find_command = { "rg", "--files", "--glob", file_pattern },
      prompt_title = prompt_title,
    })
  end, {})
end

local function search_by_directory(command_name, dir, prompt_title)
  vim.api.nvim_create_user_command(command_name, function()
    telescope.find_files({
      cwd = vim.fn.expand(dir),
      prompt_title = prompt_title,
    })
  end, {})
end

local function grep_notes(command_name, dir, prompt_title)
  vim.api.nvim_create_user_command(command_name, function()
    telescope.live_grep({
      cwd = vim.fn.expand(dir),
      type_filter = "md",
      prompt_title = prompt_title,
    })
  end, {})
end

delete_all_buffers("DeleteAllBuf")
search_by_file_type("TelescopeGo", "*.go", "Find golang Files")
search_by_file_type("TelescopeMD", "*.md", "Find markdown Files")
search_by_file_type("TelescopeMDX", "*.mdx", "Find mdx Files")
search_by_file_type("TelescopeTSX", "*.tsx", "Find tsx Files")
search_by_file_type("TelescopeTS", "*.ts", "Find ts Files")
search_by_file_type("TelescopeAstro", "*.astro", "Find astro Files")
search_by_directory("SearchNotes", "~/dev/notes", "Search markdown notes")
grep_notes("GrepNotes", "~/dev/notes/", "Grep markdown files")
