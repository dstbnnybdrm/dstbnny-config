-- REMAPS ======================================================================

local map = vim.keymap.set

-- leader key is Space
map('n', "<Space>", "<Nop>", { remap = false })
vim.g.mapleader = " "

-- NAVIGATION/MOVEMENT ---------------------------------------------------------

-- cursor stays centered after half-page jumps
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- cursor stays centered after searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- open Netrw
map("n", "<leader>ex", ":Ex<cr>", { desc = "Open Netrw" })

-- QUALITY OF LIFE -------------------------------------------------------------

-- remove search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- move lines in visual mode (yeeted from ThePrimeagen)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep previous Yank after pasting onto something (yoinked from ThePrimeagen)
map("x", "<leader>p", [["_dP]])

-- move by line on the screen rather than by line in the file
-- (less weird feeling for wrapped lines)
map("n", "j", "gj")
map("n", "k", "gk")

-- yank to system clipboard
map({ "n", "v", "x" }, "<leader>Y", [["+Y]],
    { desc = "Yank to system clipboard" })

-- LSP -------------------------------------------------------------------------

-- from https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/

-- defaults in Neovim v0.10
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>',
    { desc = "Go to previous diagnostic" })
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>',
    { desc = "Go to next diagnostic" })
map('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float()<cr>',
    { desc = "Open float diagnostic" })
map('n', '<C-w><C-d>', '<cmd>lua vim.diagnostic.open_float()<cr>',
    { desc = "Open float diagnostic" })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs)
            map(mode, rhs, lhs, { buffer = event.buf })
        end

        -- defaults in Neovim v0.11
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
        bufmap({ 'i', 's' }, '<C-s>',
            '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- custom keymaps
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap({ 'n', 'x' }, 'gq',
            '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    end,
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})

-- PLUGINS ---------------------------------------------------------------------

-- Undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- mini.pick
map("n", "<leader>pf", ":Pick files<CR>")
map("n", "<leader>pg", ":Pick grep_live<CR>")
map("n", "<leader>ph", ":Pick help<CR>")

-- fuGitive
map("n", "<leader>gs", ":Git status<CR>")
