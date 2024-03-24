require("dstbnnyjp.remap")
require("dstbnnyjp.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("dstbnnyjp.plugins")

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- show diagnostic on hover
vim.diagnostic.config({ virtual_text = false })
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

vim.g.netrw_banner = 0
