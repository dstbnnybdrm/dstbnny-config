local map = vim.keymap.set

-- leader key is space
map('n', "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

---- NAVIGATION ----

-- half-page jumping keeps cursor centered  (yeeted from ThePrimeagen)
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- searching keeps cursor centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- shortcut to opening netrw
vim.keymap.set("n", "<leader>ex", ":Ex<cr>")

---- QUALITY OF LIFE ----

-- remove search highlight
map("n", "<leader> ", ":noh<cr>")

-- move lines in visual mode (yeeted from ThePrimeagen)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- ThePrimeagen yank wizardry
map("x", "<leader>p", [["_dP]])

-- Move line on the screen rather than by line in the file
map("n", "j", "gj")
map("n", "k", "gk")

-- yank to clipboard
map({ "n", "v" }, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
