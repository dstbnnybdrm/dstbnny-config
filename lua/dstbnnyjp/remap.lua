-- leader key is space
vim.keymap.set('n', "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

---- NAVIGATION ----

-- half-page jumping keeps cursor centred (yeeted from ThePrimeagen)
-- local function lazykeys(keys)
--     keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
--     return function()
--         local old = vim.o.lazyredraw
--         vim.o.lazyredraw = true
--         vim.api.nvim_feedkeys(keys, 'nx', false)
--         vim.o.lazyredraw = old
--     end
-- end

vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

---- QUALITY OF LIFE ----

-- remove search highlight
vim.keymap.set("n", "<leader> ", ":noh<cr>")

-- move lines in visual mode (yeeted from ThePrimeagen)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ThePrimeagen yank wizardry
vim.keymap.set("x", "<leader>p", [["_dP]])
