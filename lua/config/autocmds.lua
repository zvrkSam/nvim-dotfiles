-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Prefer creating groups and assigning autocmds to groups, because it makes it easier to clear them
augroup("mygroup", { clear = true })

autocmd({ "FileType" }, {
  pattern = { "markdown", "json" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
  group = "mygroup",
})

local function delete_all_buffers(command_name)
  usercmd(command_name, function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()

    for _, i in ipairs(bufs) do
      if i ~= current_buf then
        vim.api.nvim_buf_delete(i, {})
      end
    end
  end, {})
end

local function search_by_file_type(command_name, file_pattern, prompt_title)
  usercmd(command_name, function()
    Snacks.picker.files({
      args = { "--glob", file_pattern },
      title = prompt_title,
      group = "mygroup",
    })
  end, {})
end

local function search_by_directory(command_name, dir, prompt_title)
  usercmd(command_name, function()
    Snacks.picker.files({
      dirs = { dir },
      title = prompt_title,
      group = "mygroup",
    })
  end, {})
end

local function grep_notes(command_name, dir, prompt_title)
  usercmd(command_name, function()
    Snacks.picker.grep({
      dirs = { dir },
      ft = "md",
      title = prompt_title,
      group = "mygroup",
      layout = "vtelescope",
    })
  end, {})
end

-- Delete all buffers but the current one
delete_all_buffers("DeleteAllBuf")

-- Find file type
search_by_file_type("FindGo", "*.go", "Find golang files")
search_by_file_type("FindMD", "*.md", "Find markdown files")
search_by_file_type("FindMDX", "*.mdx", "Find mdx files")
search_by_file_type("FindTSX", "*.tsx", "Find tsx files")
search_by_file_type("FindTS", "*.ts", "Find ts files")
search_by_file_type("FindAstro", "*.astro", "Find astro files")

-- Note lookup
search_by_directory("SearchNotes", "~/dev/notes", "Search markdown notes")
grep_notes("GrepNotes", "~/dev/notes/", "Grep markdown files")
