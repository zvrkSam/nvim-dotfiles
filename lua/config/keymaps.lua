-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Deleted keymaps
vim.keymap.del("n", "<leader>l", { noremap = true })
vim.keymap.del("n", "<leader>L", { noremap = true })
vim.keymap.del("n", "<leader>n", { noremap = true })

-------------------------
----- WINDOW/BUFFER -----
-------------------------
map("c", "<C-j>", "<Down>", { desc = "Next Command" })
map("c", "<C-k>", "<Up>", { desc = "Previous Command" })

-- Delete buffer
-- stylua: ignore
map("n", "<leader>d", function () Snacks.bufdelete() end, { desc = "Delete buffer", noremap = true, silent = true })
-- stylua: ignore
map("n", "<leader>D", function () Snacks.bufdelete.other() end, { desc = "Delete all buffers", noremap = true, silent = true })

-- Delete window
map("n", "<leader>W", ":close<CR>", { desc = "Delete window", noremap = true, silent = true })

-- Resizing of windows
map("n", "<A-,>", "<c-w>10>") -- horizontal expand ( left )
map("n", "<A-.>", "<c-w>10<") -- horizontal expand ( right )
map("n", "<A-t>", "<c-W>+10") -- vertical expand ( top )
map("n", "<A-s>", "<c-W>-10") -- vertical expand ( bottom )

--------------------
----- TERMINAL -----
--------------------

map({ "n", "t" }, "<A-F>", function()
  local current_dir = vim.fn.expand("%:p:h")
  if current_dir == "" or vim.fn.isdirectory(current_dir) == 0 then
    current_dir = vim.fn.getcwd()
  end
  local in_terminal = vim.bo.buftype == "terminal"
  if in_terminal then
    vim.cmd("hide")
  else
    Snacks.terminal.toggle("zsh", {
      cwd = current_dir,
      env = {
        TERM = "screen-256color",
      },
      win = {
        style = "terminal",
        relative = "editor",
        width = 0.85,
        height = 0.90,
        border = "rounded",
      },
    })
  end
end, { desc = "Toggle floating terminal" })

----------------------------
----- PICKER/FILE'S -----
----------------------------

-- Oil
map("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil", silent = true })

-- Note lookup
map("n", "<leader>fn", ":SearchNotes<CR>", { desc = "Find Notes", noremap = true, silent = true })
map("n", "<leader>fN", ":GrepNotes<CR>", { desc = "Grep Notes", noremap = true, silent = true })

-- Lookup specific file type
map("n", "<leader>fg", ":FindGo<CR>", { desc = "Find Files (go)", noremap = true, silent = true })
-- stylua: ignore
-- map("n", "<leader>fG", "<cmd>Telescope git_files<CR>", { desc = "Find Files (git-files)", noremap = true, silent = true })
map("n", "<leader>fm", ":FindMD<CR>", { desc = "Find Files (md)", noremap = true, silent = true })
map("n", "<leader>fM", ":FindMDX<CR>", { desc = "Find Files (mdx)", noremap = true, silent = true })
map("n", "<leader>ft", ":FindTS<CR>", { desc = "Find Files (ts)", noremap = true, silent = true })
map("n", "<leader>fT", ":FindTSX<CR>", { desc = "Find Files (tsx)", noremap = true, silent = true })
map("n", "<leader>fa", ":FindAstro<CR>", { desc = "Find Files (astro)", noremap = true, silent = true })

-- lazyterm remap
-- stylua: ignore
local lazyterm = function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>f?", lazyterm, { desc = "Terminal (Root Dir)" })
-- stylua: ignore
map("n", "<leader>f/", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })

-- Go to defenition in vertical and horizontal view
map("n", "g|", "<cmd>vertical winc ]<CR>", { desc = "Go to vertical defenition", silent = true })
map("n", "g-", "<cmd>horizontal winc ]<CR>", { desc = "Go to horizontal defenition", silent = true })

-- Save file to arrow
-- to toggle arrow menu is the letter R
map("n", "<leader>a", require("arrow.persist").toggle, { desc = "Arrow File Mappings (save)", silent = true })

-------------------
----- UTILITY -----
-------------------

-- Trouble
map("n", "X", "<cmd>Trouble diagnostics toggle<CR>", { noremap = true, silent = true })

-- Lazy
map("n", "<leader>Ll", "<cmd>Lazy<CR>", { desc = "Lazy", noremap = true })
map("n", "<leader>Le", "<cmd>LazyExtras<CR>", { desc = "LazyExtras", noremap = true })
-- stylua: ignore
map("n", "<leader>Ln", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog", noremap = true })

------------------------------------
----- CURSOR/TEXT MANIPULATION -----
------------------------------------

-- Delete word in normal and insert mode
map("n", "<A-w>", "ciw", { noremap = true, silent = true })
map("i", "<A-w>", "<c-o>ciw", { noremap = true, silent = true })

-- <Delete> key functionality
map("n", "<A-x>", "<Del>", { noremap = true, silent = true })
map("i", "<A-x>", "<Del>", { noremap = true, silent = true })

-- Paste in insert mode and perseve formating
map(
  "i",
  "<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>",
  "<c-r>+",
  { desc = "Paste in insert mode", noremap = true, silent = true }
)

-- Change the first letter of word from lower to upper and vice versa
map("i", "<A-d>", "<esc>b~ea", { noremap = true, silent = true })
map("n", "<A-d>", "<esc>b~e", { noremap = true, silent = true })

-- Jump to end of of the line while in insert mode
map("i", "<A-a>", "<c-o>A", { noremap = true, silent = true })

-- Center text in insert mode
map("i", "<C-z>", "<esc>zz", { noremap = true, silent = true })

-- Keep cursor centered while scrolling up and down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

---------------
----- GIT -----
---------------

-- NOTE: Diffview exists
-- :Diffview Open / Close
-- https://github.com/sindrets/diffview.nvim

-- Open Lazygit in new tmux window
map("n", "<leader>jg", function()
  local git_root = LazyVim.root.git()
  vim.fn.system("tmux new-window -c " .. vim.fn.shellescape(git_root) .. " -- lazygit")
end, { desc = "Lazygit in tmux (Root Dir)" })

-- Neogit
map("n", "<leader>jn", "<cmd>Neogit cwd=%:p:h kind=replace<CR>", { desc = "Neogit", silent = true })

-----------------
----- NOTES -----
-----------------

map("n", "<leader>nx", function()
  local line = vim.api.nvim_get_current_line()
  local new_line

  if line:match("%[%s%]") then
    new_line = line:gsub("%[%s%]", "[x]")
  elseif line:match("%[x%]") then
    new_line = line:gsub("%[x%]", "[ ]")
  else
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
end, { desc = "Toggle markdown task" })

----------------------------------
----- MISC [o]GROUP COMMANDS -----
----------------------------------

map("n", "<leader>ob", function()
  local line = vim.api.nvim_get_current_line()
  local new_line

  if line:match("false") then
    new_line = line:gsub("false", "true")
  elseif line:match("true") then
    new_line = line:gsub("true", "false")
  else
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
end, { desc = "Toggle boolean" })

map("n", "<leader>oc", require("codedocs").insert_docs, { desc = "Insert a docstring" })

-- For all lsp's sometimes manual lsp restart is required
map("n", "<leader>ol", "<cmd>LspRestart<CR>", { desc = "Lsp restart", silent = true })

-- Delete all marks
map("n", "<leader>om", "<cmd>delm!<CR>", { desc = "Delete all marks", silent = true })

-- Notifications
-- stylua: ignore
map("n", "<leader>on", function() Snacks.picker.notifications() end, { desc = "Notifications" })
-- stylua: ignore
map("n", "<leader>oN", function() Snacks.notifier.show_history() end, { desc = "Notifications(win)" })

-- Open url under cursor (anywhere on the current line)
map("n", "gx", "<esc>:URLOpenUnderCursor<CR>", { silent = true })

-- Open URLOpenUnderCursor (manual trigger, when normal gx doesnt pickup)
map("n", "<leader>oo", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL", silent = true })

-- LSP Symbols
map("n", "<leader>os", function()
  local namu = require("namu.namu_symbols")
  namu.show()
end, { desc = "LSP Symbols", silent = true })

-- Save all files
map("n", "<leader>oS", "<cmd>wa<CR>", { desc = "Save All files", noremap = true, silent = true })

-- Undo tree
map("n", "<leader>ou", "<cmd>UndotreeToggle<CR>", { desc = "Toggle UndoTree", silent = true })

-- Make file executable
map("n", "<leader>ox", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- Yank inside function
map("n", "<leader>oy", "yVa}", { noremap = true, desc = "Yank inside function" })

-- Yank diagnostics to clipboard
map("n", "<leader>oY", function()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })
  local lines = {}
  for _, d in ipairs(diagnostics) do
    table.insert(lines, d.message)
  end
  vim.fn.setreg("+", table.concat(lines, "\n"))

  Snacks.notifier.notify("Diagnostics yanked to clipboard!", "info", {
    title = "Diagnostics",
    timeout = 2000,
  })
end, { desc = "Yank diagnostics" })
