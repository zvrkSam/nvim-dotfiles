-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Overriding default keymap groups | delete
-- https://github.com/LazyVim/LazyVim/discussions/1427#discussioncomment-11460296

local map = vim.keymap.set

-- Deleted keymaps
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>n")

--------------------
----- TERMINAL -----
--------------------

-- Toggle floating terminal
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
      env = { TERM = "screen-256color" },
      win = { style = "terminal", relative = "editor", width = 0.85, height = 0.90, border = "rounded" },
    })
  end
end, { desc = "Toggle floating terminal" })

-- Lazyterm remap
-- stylua: ignore
local lazyterm = function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>f?", lazyterm, { desc = "Terminal (Root Dir)" })
-- stylua: ignore
map("n", "<leader>f/", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })

------------------------------------
----- CURSOR/TEXT MANIPULATION -----
------------------------------------

-- Put character into the blackhole register
map("n", "x", '"_x')

-- Put change into the blackhole register
map("n", "c", '"_c')

-- Move cursor to the begining of first character (regular ^ is hard to reach)
map({ "n", "v" }, "<A-e>", "^")

-- Change word in normal and insert mode
map("n", "<A-w>", "ciw")
map("n", "<A-W>", "ciW")
map("i", "<A-w>", "<c-o>ciw")

-- <Delete> key functionality
map({ "n", "i" }, "<A-x>", "<Del>")

-- Change the first letter of word from lower to upper and vice versa
map("i", "<A-d>", "<esc>b~ea")
map("n", "<A-d>", "<esc>b~e")

-- Jump to end of of the line while in insert mode
map("i", "<A-a>", "<c-o>A")

-- Center text in insert mode
map("i", "<A-z>", "<esc>zza")

-- Select whole file
map("n", "<A-f>", "ggVG", { desc = "Select whole file" })

-- Keep cursor centered while scrolling up and down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

--------------------
----- MOVEMENT -----
--------------------

-- Next Previous command in command line
map("c", "<C-j>", "<Down>", { desc = "Next Command" })
map("c", "<C-k>", "<Up>", { desc = "Previous Command" })

-- Shell commands
map("n", "<leader>C", ":!", { desc = "Shell commands | Filter" })
-- Search web with custom script
map("n", "<leader>F", ":!web ", { desc = "Search web" })

-------------------------
----- WINDOW/BUFFER -----
-------------------------

-- Delete buffer
-- stylua: ignore
map("n", "<leader>d", function () Snacks.bufdelete() end, { desc = "Delete buffer" })
-- stylua: ignore
map("n", "<leader>D", function () Snacks.bufdelete.other() end, { desc = "Delete all buffers" })

-- Delete window
map("n", "<leader>W", ":close<CR>", { desc = "Delete window", silent = true })

-- Resizing of windows
map("n", "<A-.>", "<c-w>10>") -- horizontal expand ( left )
map("n", "<A-,>", "<c-w>10<") -- horizontal expand ( right )
map("n", "<A-t>", "<c-W>+10") -- vertical expand ( top )
map("n", "<A-s>", "<c-W>-10") -- vertical expand ( bottom )

-- Go to defenition in vertical and horizontal view
map("n", "g|", "<cmd>vertical winc ]<CR>", { desc = "Go to vertical defenition" })
map("n", "g-", "<cmd>horizontal winc ]<CR>", { desc = "Go to horizontal defenition" })

-- Swapping layout
map("n", "<F3>", "<C-w>H<CR>", { desc = "Swap from horizontal to vertical" })
map("n", "<F4>", "<C-w>K<CR>", { desc = "Swap from vertical to horizontal" })

-------------------------
----- PICKER/FILE'S -----
-------------------------

-- Line select in buffer
map("n", "<BS>", function()
  Snacks.picker.lines({ title = "Search in buffer", layout = "lines_select" })
end, { desc = "Line select in buffer" })

-- Oil
map("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil" })

-- Save file to arrow
-- to toggle arrow menu is the letter R
map("n", "<leader>a", require("arrow.persist").toggle, { desc = "Arrow File Mappings (save)" })

-- Lookup specific file type
map("n", "<leader>fg", ":FindGo<CR>", { desc = "Find Files (go)", silent = true })
map("n", "<leader>fm", ":FindMD<CR>", { desc = "Find Files (md)", silent = true })
map("n", "<leader>fM", ":FindMDX<CR>", { desc = "Find Files (mdx)", silent = true })
map("n", "<leader>ft", ":FindTS<CR>", { desc = "Find Files (ts)", silent = true })
map("n", "<leader>fT", ":FindTSX<CR>", { desc = "Find Files (tsx)", silent = true })
map("n", "<leader>fa", ":FindAstro<CR>", { desc = "Find Files (astro)", silent = true })

-------------------
----- UTILITY -----
-------------------

-- LSP Symbols
-- stylua: ignore
map("n", "|", function() require("namu.namu_symbols").show() end, { desc = "LSP Symbols" })

-- Open diagnostics in float
-- stylua: ignore
map("n", "Z", function () vim.diagnostic.open_float() end, {  desc = "Open diagnostic in float"})

-- Trouble
map("n", "X", "<cmd>Trouble diagnostics toggle<CR>", {})

-- Lazy
map("n", "<leader>Ll", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>Le", "<cmd>LazyExtras<CR>", { desc = "LazyExtras" })
-- stylua: ignore
map("n", "<leader>Ln", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog",  })

---------------
----- GIT -----
---------------

-- Close tab (Diffview uses tabs)
map("n", "Q", ":tabclose<CR>", { desc = "Close current tab", silent = true })

-- Open Diffview
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })

-- Open Lazygit in new tmux window
map("n", "<leader>gt", function()
  local git_root = LazyVim.root.git()
  vim.fn.system("tmux new-window -c " .. vim.fn.shellescape(git_root) .. " -- lazygit")
end, { desc = "Lazygit in tmux (Root Dir)" })

-- Neogit
-- map("n", "<leader>jn", "<cmd>Neogit cwd=%:p:h kind=replace<CR>", { desc = "Neogit" })

-----------------
----- NOTES -----
-----------------

-- Note lookup
map("n", "<leader>nN", ":SearchNotes<CR>", { desc = "Find Notes", silent = true })
map("n", "<leader>nn", ":GrepNotes<CR>", { desc = "Grep Notes", silent = true })

-- Toggle checked/unchecked
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

-- Took this these two keybinds linkarzu
--
-- In visual mode, check if the selected text is already bold and show a message if it is
-- If not, surround it with double asterisks for bold
vim.keymap.set("v", "<leader>nb", function()
  -- Get the selected text range
  local start_row, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local end_row, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
  -- Get the selected lines
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  local selected_text = table.concat(lines, "\n"):sub(start_col, #lines == 1 and end_col or -1)
  if selected_text:match("^%*%*.*%*%*$") then
    vim.notify("Text already bold", vim.log.levels.INFO)
  else
    vim.cmd("normal 2gsa*")
  end
end, { desc = "Bold text" })

-- Multiline unbold attempt
-- In normal mode, bold the current word under the cursor
-- If already bold, it will unbold the word under the cursor
-- If you're in a multiline bold, it will unbold it only if you're on the
-- first line
vim.keymap.set("n", "<leader>nb", function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_buffer = vim.api.nvim_get_current_buf()
  local start_row = cursor_pos[1] - 1
  local col = cursor_pos[2]
  -- Get the current line
  local line = vim.api.nvim_buf_get_lines(current_buffer, start_row, start_row + 1, false)[1]
  -- Check if the cursor is on an asterisk
  if line:sub(col + 1, col + 1):match("%*") then
    vim.notify("Cursor is on an asterisk, run inside the bold text", vim.log.levels.WARN)
    return
  end
  -- Search for '**' to the left of the cursor position
  local left_text = line:sub(1, col)
  local bold_start = left_text:reverse():find("%*%*")
  if bold_start then
    bold_start = col - bold_start
  end
  -- Search for '**' to the right of the cursor position and in following lines
  local right_text = line:sub(col + 1)
  local bold_end = right_text:find("%*%*")
  local end_row = start_row
  while not bold_end and end_row < vim.api.nvim_buf_line_count(current_buffer) - 1 do
    end_row = end_row + 1
    local next_line = vim.api.nvim_buf_get_lines(current_buffer, end_row, end_row + 1, false)[1]
    if next_line == "" then
      break
    end
    right_text = right_text .. "\n" .. next_line
    bold_end = right_text:find("%*%*")
  end
  if bold_end then
    bold_end = col + bold_end
  end
  -- Remove '**' markers if found, otherwise bold the word
  if bold_start and bold_end then
    -- Extract lines
    local text_lines = vim.api.nvim_buf_get_lines(current_buffer, start_row, end_row + 1, false)
    local text = table.concat(text_lines, "\n")
    -- Calculate positions to correctly remove '**'
    -- vim.notify("bold_start: " .. bold_start .. ", bold_end: " .. bold_end)
    local new_text = text:sub(1, bold_start - 1) .. text:sub(bold_start + 2, bold_end - 1) .. text:sub(bold_end + 2)
    local new_lines = vim.split(new_text, "\n")
    -- Set new lines in buffer
    vim.api.nvim_buf_set_lines(current_buffer, start_row, end_row + 1, false, new_lines)
    -- vim.notify("Unbolded text", vim.log.levels.INFO)
  else
    -- Bold the word at the cursor position if no bold markers are found
    local before = line:sub(1, col)
    local after = line:sub(col + 1)
    local inside_surround = before:match("%*%*[^%*]*$") and after:match("^[^%*]*%*%*")
    if inside_surround then
      vim.cmd("normal gsd*.")
    else
      vim.cmd("normal viw")
      vim.cmd("normal 2gsa*")
    end
    -- vim.notify("Bolded current word", vim.log.levels.INFO)
  end
end, { desc = "Bold text" })

----------------------------------
----- MISC [o]GROUP COMMANDS -----
----------------------------------

-- Toggle boolean
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

-- Copy diagnostics to clipboard
map("n", "<leader>oC", function()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })
  local lines = {}
  for _, d in ipairs(diagnostics) do
    table.insert(lines, d.message)
  end
  vim.fn.setreg("+", table.concat(lines, "\n"))

  if #lines ~= 0 then
    Snacks.notifier.notify("Diagnostics copied to clipboard!", "warn", {
      title = "Clipboard",
      icon = "",
      timeout = 3000,
    })
  end
end, { desc = "Copy diagnostics" })

-- Open Dashboard
-- stylua: ignore
map("n", "<leader>oD", function() Snacks.dashboard() end, { desc = "Open Dashboard" })

-- Copy current file path
map("n", "<leader>oF", function()
  vim.cmd('let @+ = expand("%:p")')
  Snacks.notifier.notify("Path copied to clipboard!\n" .. vim.fn.expand("%:p"), "warn", {
    title = "Clipboard",
    icon = "",
    timeout = 3000,
  })
end, { desc = "Copy current file path", silent = true })

-- Delete all marks
map("n", "<leader>om", "<cmd>delm!<CR>", { desc = "Delete all marks" })

-- Notifications
-- stylua: ignore
map("n", "<leader>on", function() Snacks.notifier.show_history() end, { desc = "Notifications" })

-- Duplicate and comment out
map("n", "<leader>oo", "yy<cmd>normal gcc<CR>p", { desc = "Duplicate and comment out" })
map("v", "<leader>oo", "y`>pgv<cmd>normal gc<CR>", { desc = "Duplicate and comment out" })

-- Save and quit neovim (keep layout)
map("n", "<leader>oq", "<cmd>wqa<CR>", { desc = "Save and Quit neovim" })

-- For all lsp's sometimes manual lsp restart is required
map("n", "<leader>or", "<cmd>LspRestart<CR>", { desc = "Lsp restart" })

-- Registers in snacks picker
-- stylua: ignore
map("n", "<leader>oR", function() Snacks.picker.registers({ layout = "select"}) end, { desc = "Registers" })

-- Save all files
map("n", "<leader>oS", "<cmd>wa<CR>", { desc = "Save All files" })

-- Undo tree
map("n", "<leader>ou", "<cmd>UndotreeToggle<CR>", { desc = "Toggle UndoTree" })

-- Make file executable
map("n", "<leader>ox", function()
  vim.cmd("e")
  vim.cmd("!chmod 755 %")
end, { desc = "Make file executable" })

-- Yank inside function
map("n", "<leader>oy", "ya}", { desc = "Yank inside function" })

--------------------------------------
----- DOCUMENT [O]GROUP COMMANDS -----
--------------------------------------

-- Docstring
map("n", "<leader>Oc", require("codedocs").insert_docs, { desc = "Insert a docstring" })

-- Golang documentation
map("n", "<leader>Og", "<cmd>GoDoc<CR>", { desc = "Golang documentation" })

-- Python documentation
map("n", "<leader>Op", "<cmd>PyDoc<CR>", { desc = "Python documentation" })
