-- PLUGINS =====================================================================

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, { desc = "Toggle Undotree" })

vim.pack.add({
    "https://github.com/rose-pine/neovim",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.surround",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim"
})

require("rose-pine").setup({
    variant = "dawn", -- aaa flashbang
    dark_variant = "main",
    enable = {
        terminal = true,
    },
    styles = {
        italic = false,
        transparency = true,
    }
})
vim.cmd.colorscheme("rose-pine-dawn")

require("which-key").setup({
    preset = "helix"
})

require("mini.pick").setup()
vim.keymap.set("n", "<leader>pf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>pg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>pb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>ph", ":Pick help<CR>")

-- setup similar to tpope's "vim-surround"
require("mini.surround").setup({
    mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        -- if don't want extended mappings
        -- suffix_last = "",
        -- suffix_next = "",
    },
    search_method = "cover_or_next",
})
-- Remap adding surrounding to Visual mode selection
vim.keymap.del("x", "ys")
vim.keymap.set(
    "x", "S", [[:<C-u>lua MiniSurround.add("visual")<CR>]], { silent = true }
)
-- make special mapping for "add surrounding for line"
vim.keymap.set("n", "yss", "ys_", { remap = true })

require("mini.pairs").setup()

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "html", "cssls", "biome", "clangd", "cmake", "lua_ls",
    }
}

vim.lsp.config["lua_ls"] = {
    settings = {
        Lua = {
            diagnostics = {
                -- so Language Server recognizes "vim" global
                globals = { "vim" },
            },
            workspace = {
                -- make the Language Server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
}
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- format on save
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
