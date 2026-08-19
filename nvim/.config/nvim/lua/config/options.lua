local opt = vim.opt

-- Appearance
opt.termguicolors = true -- True color support
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers (great for motions)
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 8 -- Keeps 8 lines above and below cursor at all times
opt.cursorline = true -- Highlight current line
opt.laststatus = 3 -- Use a single global statusline (fixes Neo-tree/Lualine clutter)
opt.signcolumn = "yes" -- Always reserve space for signs (prevents text shifting when diagnostics/gitsigns appear)

-- Tabs & Indentation
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically

-- Search
opt.ignorecase = true -- Case-insensitive searching...
opt.smartcase = true -- ...unless uppercase is used

-- Window Management
opt.splitright = true -- Splits to the right of current
opt.splitbelow = true -- Vertical splits below current

-- System & History
opt.mouse = "a" -- Enable mouse support in all modes
opt.undofile = true -- Save undo history to a file (persists across sessions)
opt.updatetime = 250 -- Faster response time for CursorHold events (gitsigns, hover, etc.)
-- opt.clipboard = "unnamedplus" -- Use the system clipboard for yank/paste

vim.diagnostic.config({
  virtual_text = true,
})
