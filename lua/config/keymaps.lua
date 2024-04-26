-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- open url under cursor
vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", { silent = true })

-- toggleterm
vim.keymap.set("n", "<leader>oo", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm", silent = true })

-- telescope | search bookmarks
vim.keymap.set("n", "<leader>ob", "<cmd>BrowserBookmarks<cr>", { desc = "Search browser bookmarks", silent = true })

-- gopls sometimes doesnt pick newly imported packages so manual restart is required
vim.keymap.set("n", "<leader>oL", "<cmd>LspRestart<cr>", { desc = "Lsp restart", silent = true })

-- ZenMode
vim.keymap.set("n", "<leader>oz", "<cmd>ZenMode<cr>", { desc = "Zen Mode", silent = true })

-- save all files
vim.keymap.set("n", "<leader>os", "<cmd>wa<cr>", { desc = "Save All files", noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>n", "<cmd>Neogit kind=split<cr>", { desc = "Neogit", silent = true })
-- vim.keymap.set("n", "<leader>nc", "<cmd>Neogit commit<cr>", { desc = "Neogit commit", silent = true })

-- go to defenition in vertical and horizontal view
vim.keymap.set("n", "g|", "<cmd>vertical winc ]<cr>", { desc = "Go to vertical defenition", silent = true })
vim.keymap.set("n", "g-", "<cmd>horizontal winc ]<cr>", { desc = "Go to horizontal defenition", silent = true })

-- Codeium turn off / on
vim.keymap.set("n", "<leader>oc", "<cmd>CodeiumToggle<cr>", { desc = "Codeium Toggle", silent = true })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil", silent = true })

-- Center text in insert mode
vim.keymap.set("i", "<c-z>", "<esc>zz", { noremap = true, silent = true })

-- Text manipulation
-- Change the first letter of word from lower to upper and vice versa
vim.keymap.set("i", "<a-d>", "<esc>b~ea", { noremap = true, silent = true })
vim.keymap.set("n", "<a-d>", "<esc>b~e", { noremap = true, silent = true })
