-- leader key is space
vim.keymap.set('n', "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

---- NAVIGATION ----

-- half-page jumping keeps cursor centred (yeeted from ThePrimeagen)
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- remap page up/down keys from full- to half-page jumping
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")

---- QUALITY OF LIFE ----

-- remove search highlight
vim.keymap.set("n", "<leader> ", ":noh<cr>")

-- move lines in visual mode (yeeted from ThePrimeagen)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ThePrimeagen yank wizardry
vim.keymap.set("x", "<leader>p", [["_dP]])

