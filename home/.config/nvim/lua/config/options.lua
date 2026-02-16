-- Editing
vim.o.tabstop = 2

-- Indent
vim.o.autoindent = true
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Navigation
vim.o.mouse = "n"

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8

vim.o.showmatch = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Theme

vim.opt.termguicolors = true

-- Hints
vim.o.signcolumn = "yes"

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.cursorline = true

vim.o.inccommand = "split"

vim.o.showmode = true
vim.o.showcmd = true

vim.o.breakindent = true

vim.o.errorbells = false
vim.o.visualbell = false

-- Plumbing
vim.o.undofile = true
vim.o.swapfile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
