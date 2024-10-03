-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Delete buffer
map("n", "<leader>d", ":bdelete<cr>", { desc = "Delete buffer", noremap = true, silent = true })

-- Delete window
map("n", "<leader>W", ":close<CR>", { desc = "Delete window", noremap = true, silent = true })

-- Telescope pull-up notes
map("n", "<leader>fn", ":SearchNotes<cr>", { desc = "Lookup notes", noremap = true, silent = true })

-- Telescope lookup specific file type
map("n", "<leader>fG", ":TelescopeGo<cr>", { desc = "Find Files (go)", noremap = true, silent = true })
map("n", "<leader>fm", ":TelescopeMD<cr>", { desc = "Find Files (md)", noremap = true, silent = true })
map("n", "<leader>fM", ":TelescopeMDX<cr>", { desc = "Find Files (mdx)", noremap = true, silent = true })
map("n", "<leader>fj", ":TelescopeTSX<cr>", { desc = "Find Files (tsx)", noremap = true, silent = true })
map("n", "<leader>fJ", ":TelescopeTS<cr>", { desc = "Find Files (ts)", noremap = true, silent = true })
map("n", "<leader>fa", ":TelescopeAstro<cr>", { desc = "Find Files (astro)", noremap = true, silent = true })

-- Go to defenition in vertical and horizontal view
map("n", "g|", "<cmd>vertical winc ]<cr>", { desc = "Go to vertical defenition", silent = true })
map("n", "g-", "<cmd>horizontal winc ]<cr>", { desc = "Go to horizontal defenition", silent = true })

-- Oil
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil", silent = true })

-- Center text in insert mode
map("i", "<c-z>", "<esc>zz", { noremap = true, silent = true })

-- Text manipulation
map("i", "<a-p>", "<c-r>+", { desc = "Paste in insert mode", noremap = true, silent = true })

-- Change the first letter of word from lower to upper and vice versa
map("i", "<a-d>", "<esc>b~ea", { noremap = true, silent = true })
map("n", "<a-d>", "<esc>b~e", { noremap = true, silent = true })

-- Cursor manipulation
-- Jump to end of of the line while in insert mode
map("i", "<a-a>", "<c-o>A", { noremap = true, silent = true })

-- Resizing of windows
map("n", "<a-.>", "<c-w>10<")
map("n", "<a-,>", "<c-w>10>")
map("n", "<a-t>", "<c-W>+10")
map("n", "<a-s>", "<c-W>-10")

-- Open url under cursor
map("n", "gx", "<esc>:URLOpenUnderCursor<cr>", { silent = true })

-- MY SPECIAL COMMANDS --
-- <leader>o --

-- Telescope | search bookmarks
map("n", "<leader>ob", "<cmd>BrowserBookmarks<cr>", { desc = "Search browser bookmarks", silent = true })

-- Gopls sometimes doesnt pick newly imported packages so manual restart is required
map("n", "<leader>oL", "<cmd>LspRestart<cr>", { desc = "Restart gopls", silent = true })

-- ZenMode and Twilight
map("n", "<leader>oz", "<cmd>ZenMode<cr>", { desc = "Zen Mode", silent = true })
map("n", "<leader>ot", "<cmd>Twilight<cr>", { desc = "Twilight Mode", silent = true })

-- Save all files
map("n", "<leader>os", "<cmd>wa<cr>", { desc = "Save All files", noremap = true, silent = true })

-- Save file to arrow
map("n", "<leader>A", require("arrow.persist").toggle, { desc = "Arrow File Mappings (save)", silent = true })

-- Codeium turn off / on
map("n", "<leader>oc", "<cmd>CodeiumToggle<cr>", { desc = "Codeium Toggle", silent = true })
