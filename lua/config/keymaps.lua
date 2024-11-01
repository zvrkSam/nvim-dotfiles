-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-------------------------
----- WINDOW/BUFFER -----
-------------------------

-- Delete buffer
map("n", "<leader>d", ":bdelete<CR>", { desc = "Delete buffer", noremap = true, silent = true })
map("n", "<leader>D", ":DeleteAllBuf<CR>", { desc = "Delete all buffers", noremap = true, silent = true })

-- Delete window
map("n", "<leader>W", ":close<CR>", { desc = "Delete window", noremap = true, silent = true })

-- Resizing of windows
map("n", "<A-,>", "<c-w>10>") -- horizontal expand ( left )
map("n", "<A-.>", "<c-w>10<") -- horizontal expand ( right )
map("n", "<A-t>", "<c-W>+10") -- vertical expand ( top )
map("n", "<A-s>", "<c-W>-10") -- vertical expand ( bottom )

----------------------------
----- TELESCOPE/FILE'S -----
----------------------------

-- Oil
map("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil", silent = true })

-- Telescope pull-up notes
map("n", "<leader>fn", ":GrepNotes<CR>", { desc = "Notes (grep)", noremap = true, silent = true })
map("n", "<leader>fN", ":SearchNotes<CR>", { desc = "Notes (find)", noremap = true, silent = true })

-- Telescope lookup specific file type
map("n", "<leader>fg", ":TelescopeGo<CR>", { desc = "Find Files (go)", noremap = true, silent = true })
-- stylua: ignore
map("n", "<leader>fG", "<cmd>Telescope git_files<CR>", { desc = "Find Files (git-files)", noremap = true, silent = true })
map("n", "<leader>fm", ":TelescopeMD<CR>", { desc = "Find Files (md)", noremap = true, silent = true })
map("n", "<leader>fM", ":TelescopeMDX<CR>", { desc = "Find Files (mdx)", noremap = true, silent = true })
map("n", "<leader>ft", ":TelescopeTS<CR>", { desc = "Find Files (ts)", noremap = true, silent = true })
map("n", "<leader>fT", ":TelescopeTSX<CR>", { desc = "Find Files (tsx)", noremap = true, silent = true })
map("n", "<leader>fa", ":TelescopeAstro<CR>", { desc = "Find Files (astro)", noremap = true, silent = true })

-- lazyterm remap
-- stylua: ignore
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>f?", lazyterm, { desc = "Terminal (Root Dir)" })
-- stylua: ignore
map("n", "<leader>f/", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })

-- Go to defenition in vertical and horizontal view
map("n", "g|", "<cmd>vertical winc ]<CR>", { desc = "Go to vertical defenition", silent = true })
map("n", "g-", "<cmd>horizontal winc ]<CR>", { desc = "Go to horizontal defenition", silent = true })

-- Save file to arrow
-- to toggle arrow menu is the letter R
map("n", "<leader>a", require("arrow.persist").toggle, { desc = "Arrow File Mappings (save)", silent = true })

------------------------------------
----- CURSOR/TEXT MANIPULATION -----
------------------------------------

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

-------------------------
----- MISC COMMANDS -----
-------------------------

-- Search bookmarks
map("n", "<leader>ob", "<cmd>BrowserBookmarks<CR>", { desc = "Search browser bookmarks", silent = true })

-- Codeium turn off / on
map("n", "<leader>oc", "<cmd>CodeiumToggle<CR>", { desc = "Toggle Codeium", silent = true })

-- LazyExtras
map("n", "<leader>oe", "<cmd>LazyExtras<CR>", { desc = "LazyExtras", silent = true })

-- For all lsp's sometimes manual lsp restart is required
map("n", "<leader>ol", "<cmd>LspRestart<CR>", { desc = "Lsp restart", silent = true })

-- Delete all marks
map("n", "<leader>om", "<cmd>delm!<CR>", { desc = "Delete all marks", silent = true })

-- Notifications in Telescope view
map("n", "<leader>on", "<cmd>Telescope notify<CR>", { desc = "Notifications", silent = true })

-- Open url under cursor (anywhere on the current line)
map("n", "gx", "<esc>:URLOpenUnderCursor<CR>", { silent = true })

-- Open URLOpenUnderCursor (manual trigger, when normal gx doesnt pickup)
map("n", "<leader>oo", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL", silent = true })

-- Precognition
map("n", "<leader>op", "<cmd>Precognition toggle<CR>", { desc = "Toggle Precognition", silent = true })

-- Save all files
map("n", "<leader>os", "<cmd>wa<CR>", { desc = "Save All files", noremap = true, silent = true })

-- Undo tree
map("n", "<leader>ou", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Twilight Mode", silent = true })

-- ZenMode and Twilight
map("n", "<leader>ot", "<cmd>Twilight<CR>", { desc = "Toggle Twilight Mode", silent = true })
map("n", "<leader>oz", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode", silent = true })

map("n", "<leader>oy", function()
  local diagnostics = vim.diagnostic.get(0)
  local lines = {}
  for _, d in ipairs(diagnostics) do
    table.insert(lines, d.message)
  end
  vim.fn.setreg("+", table.concat(lines, "\n"))

  require("notify")("Diagnostics yanked to clipboard!", "info", {
    title = "Diagnostics",
    timeout = 2000,
  })
end, { desc = "Yank diagnostics" })
