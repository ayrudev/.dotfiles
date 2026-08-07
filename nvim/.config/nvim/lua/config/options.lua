local opt = vim.opt
local fn = vim.fn

-- Appearance
opt.termguicolors = true -- True color support
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers (great for motions)
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 8 -- Keeps 8 lines above and below cursor at all times
opt.cursorline = true -- Highlight current line
opt.laststatus = 3 -- Use a single global statusline (fixes Neo-tree/Lualine clutter)
opt.signcolumn = "yes"

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
opt.updatetime = 300
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"
opt.shortmess:append("c")

local state_dir = fn.stdpath("state")
opt.undodir = state_dir .. "/undo"
opt.swapfile = true
opt.backupdir = state_dir .. "/backup//"
opt.directory = state_dir .. "/swap//"

fn.mkdir(opt.undodir:get(), "p")
fn.mkdir(state_dir .. "/backup", "p")
fn.mkdir(state_dir .. "/swap", "p")

local cursorline_group = vim.api.nvim_create_augroup("ActiveWindowCursorline", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = cursorline_group,
  callback = function()
    vim.wo.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = cursorline_group,
  callback = function()
    vim.wo.cursorline = false
  end,
})
