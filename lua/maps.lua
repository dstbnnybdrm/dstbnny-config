-- REMAPS ======================================================================

local map = vim.keymap.set

-- set leader key to Space
map('n', "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

-- MOVEMENT ---------------------------------------------------------

-- cursor stays centred after half-page jumps
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- cursor stays centred after searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- open Netrw
map("n", "<leader>ex", ":Ex<cr>", { desc = "Open Netrw" })

-- EDITING ---------------------------------------------------------------------

-- move lines in visual mode (yeeted from ThePrimeagen)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep previous Yank after pasting onto something (yoinked from ThePrimeagen)
map("x", "<leader>p", [["_dP]])

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})
