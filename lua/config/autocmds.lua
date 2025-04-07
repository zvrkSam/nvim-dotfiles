-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Prefer creating groups and assigning autocmds to groups, because it makes it easier to clear them
augroup("mygroup", { clear = true })

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
      layout = "ivy_split",
    })
  end, {})
end

-- Find file type
search_by_file_type("FindAstro", "*.astro", "Find astro files")
search_by_file_type("FindGo", "*.go", "Find golang files")
search_by_file_type("FindTS", "*.ts", "Find ts files")
search_by_file_type("FindTSX", "*.tsx", "Find tsx files")
search_by_file_type("FindMD", "*.md", "Find markdown files")
search_by_file_type("FindMDX", "*.mdx", "Find mdx files")

-- Note lookup
search_by_directory("SearchNotes", "~/dev/notes", "Search notes by name")
grep_notes("GrepNotes", "~/dev/notes/", "Grep in notes")

-- Dot files lookup
-- search_by_directory("SearchDots", "~/dev/dots/", "Grep dot files")
