local lsp_zero = require("lsp-zero")

-- use default keymaps
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- LSP CONFIGURATION

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        -- web dev
        "html",
        "cssls",
        "tsserver",
        "eslint",
        -- C++ dev
        "clangd",
        "cmake",
        -- other
        "marksman",
    },
    handlers = {
        lsp_zero.default_setup,
        -- to stop showing me warnings on every line in my config lmao
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})

-- FORMATTING

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 500,
    },
    servers = {
        ["clangd"] = { "cpp", "hpp" },
    },
})

require("conform").setup({
    formatters_by_ft = {
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

-- AUTOCOMPLETION

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({ details = true })

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip", keyword_length = 2 },
        { name = "path" },
        { name = "buffer",  keyword_length = 3 },
        { name = "spell",   keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    formatting = cmp_format,
})
