-- REMAPS ======================================================================

local map = vim.keymap.set

-- set leader key to Space
map("n", "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

-- MOVEMENT ---------------------------------------------------------

-- keep cursor centred after half-page jumps
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- keep cursor centred + show cursor line after searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- open Netrw
map("n", "<leader>ex", "<cmd>Ex<cr>", { desc = "Open Netrw" })

-- EDITING ---------------------------------------------------------------------

-- move lines in visual mode + respect indentation (yoinked from ThePrimeagen)
-- https://github.com/ThePrimeagen/init.lua
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- highlight Yanked text
-- https://pawelgrzybek.com/highlight-yanked-text-in-neovim/
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { timeout = 500 }
    end
})

-- format manually
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP Format" })

-- format on save:
-- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format { async = false, id = args.data.client_id }
            end,
        })
    end
})
