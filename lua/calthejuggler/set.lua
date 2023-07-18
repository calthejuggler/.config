vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.errorbells = false

vim.opt.encoding = "UTF-8"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.clipboard = "unnamed"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.g.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.opt.guifont = "FiraCode Nerd Font:h10"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.ignorecase = true

vim.g.mapleader = " "
