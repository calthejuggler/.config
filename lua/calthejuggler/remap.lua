vim.g.mapleader = " "

vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<leader>ev", ":split ~/.config/nvim<CR>")
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n","zz",":wq<CR>")

