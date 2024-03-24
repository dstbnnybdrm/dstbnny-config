require("dstbnnyjp.remap")
require("dstbnnyjp.set")
require("dstbnnyjp.lazy")

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- show diagnostic on hover
vim.diagnostic.config({ virtual_text = false })
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

vim.g.netrw_banner = 0
