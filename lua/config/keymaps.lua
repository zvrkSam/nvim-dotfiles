-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-------------------------
----- WINDOW/BUFFER -----
-------------------------

-- Delete buffer
map("n", "<leader>d", ":bdelete<CR>", { desc = "Delete buffer", noremap = true, silent = true })

-- Delete window
map("n", "<leader>W", ":close<CR>", { desc = "Delete window", noremap = true, silent = true })

-- Resizing of windows
map("n", "<A-.>", "<c-w>10<")
map("n", "<A-,>", "<c-w>10>")
map("n", "<A-t>", "<c-W>+10")
map("n", "<A-s>", "<c-W>-10")

----------------------------
----- TELESCOPE/FILE'S -----
----------------------------

-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil", silent = true })

-- Telescope pull-up notes
map("n", "<leader>fn", ":SearchNotes<CR>", { desc = "Lookup notes", noremap = true, silent = true })

-- Telescope lookup specific file type
map("n", "<leader>fG", ":TelescopeGo<CR>", { desc = "Find Files (go)", noremap = true, silent = true })
map("n", "<leader>fm", ":TelescopeMD<CR>", { desc = "Find Files (md)", noremap = true, silent = true })
map("n", "<leader>fM", ":TelescopeMDX<CR>", { desc = "Find Files (mdx)", noremap = true, silent = true })
map("n", "<leader>fj", ":TelescopeTSX<CR>", { desc = "Find Files (tsx)", noremap = true, silent = true })
map("n", "<leader>fJ", ":TelescopeTS<CR>", { desc = "Find Files (ts)", noremap = true, silent = true })
map("n", "<leader>fa", ":TelescopeAstro<CR>", { desc = "Find Files (astro)", noremap = true, silent = true })

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
map("n", "<C-x>", "<Del>", { noremap = true, silent = true })
map("i", "<C-x>", "<Del>", { noremap = true, silent = true })

-- PASTE IN INSERT MODE AND PERSEVE FORMATING
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

-- Open url under cursor
map("n", "gx", "<esc>:URLOpenUnderCursor<CR>", { silent = true })

-- Search bookmarks
map("n", "<leader>ob", "<cmd>BrowserBookmarks<CR>", { desc = "Search browser bookmarks", silent = true })

-- Codeium turn off / on
map("n", "<leader>oc", "<cmd>CodeiumToggle<CR>", { desc = "Codeium Toggle", silent = true })

-- Gopls sometimes doesnt pick newly imported packages so manual restart is required
map("n", "<leader>oL", "<cmd>LspRestart<CR>", { desc = "Restart gopls", silent = true })

-- Save all files
map("n", "<leader>os", "<cmd>wa<CR>", { desc = "Save All files", noremap = true, silent = true })

-- ZenMode and Twilight
map("n", "<leader>oz", "<cmd>ZenMode<CR>", { desc = "Zen Mode", silent = true })
map("n", "<leader>ot", "<cmd>Twilight<CR>", { desc = "Twilight Mode", silent = true })
