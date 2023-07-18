vim.g.copilot_no_tab_map = true

vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]

vim.cmd[[imap <C-i> <Plug>(copilot-previous)]]

vim.cmd[[imap <C-o> <Plug>(copilot-next)]]


