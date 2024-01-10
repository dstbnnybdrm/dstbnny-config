---- LSP ----

-- use "minimal" preset
local lsp_zero = require("lsp-zero").preset({})

lsp_zero.on_attach(function(client, bufnr)
    -- set keymaps
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp_zero.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp_zero.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)
end)

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["null-ls"] = {"html", "css", "javascript", "markdown"},
    },
})

lsp_zero.setup()

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {"html", "cssls", "eslint"},
  handlers = {
    lsp_zero.default_setup,
  },
})

require("mason-null-ls").setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
  }
})

---- COMPLETION ----

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    -- specify snippet engine
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "luasnip"},
        {name = "buffer"},
        -- nvim's lua api
        {name = 'nvim_lua'},
    },
})

