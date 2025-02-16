-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.hlsearch = true
local opt = vim.opt

opt.scrolloff = 20

-- Copy indent from current line when starting a new line (When <CR> or 'o' or 'O')
-- opt.autoindent = true

-- Set this for ToggleTerm terminals to not be discarded when closed
opt.hidden = true

-- Set eventignore so that tmux does not show `activity` every time we change from a window with Neovim
opt.eventignore = "FocusLost"

vim.o.termguicolors = true

-- Highlight the text line of the cursor
opt.cursorlineopt = "number"

-- Sets borders and popus to transparent
opt.pumblend = 0

vim.g.snacks_animate = false

vim.opt.conceallevel = 1

-- opt.statuscolumn = "%r%s"
-- netrw is builtin file explorer that comes with neovim
-- it is disabled in lazy.lua
