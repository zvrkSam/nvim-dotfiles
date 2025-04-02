-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.hlsearch = true

vim.opt.scrolloff = 13

-- Copy indent from current line when starting a new line (When <CR> or 'o' or 'O')
-- opt.autoindent = true

-- Set this for ToggleTerm terminals to not be discarded when closed
-- opt.hidden = true

-- Set eventignore so that tmux does not show `activity` every time we change from a window with Neovim
vim.opt.eventignore = "FocusLost"

-- Highlight the text line of the cursor
vim.opt.cursorlineopt = "number"

-- Sets borders and popus to transparent
vim.opt.pumblend = 0

vim.g.snacks_animate = false

vim.opt.conceallevel = 0
vim.opt.signcolumn = "no"

-- opt.statuscolumn = "%r%s"
-- netrw is builtin file explorer that comes with neovim
-- it is disabled in lazy.lua

-- Line lenght and wraping
vim.opt.textwidth = 120
vim.opt.wrap = true
