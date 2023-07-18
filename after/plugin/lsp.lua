-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer'
})

lsp.on_attach(function(client,buffer)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "T", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "]g", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[g", function() vim.diagnostic.goto_prev() end, opts)
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
