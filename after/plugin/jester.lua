require("jester").setup({
    cmd = "npm run test -t '$result' -- $file"
})

vim.cmd[[nmap <leader>t :lua require"jester".run_file()<CR>]]
vim.cmd[[nmap <leader>ta :lua require"jester".run()<CR>]]
