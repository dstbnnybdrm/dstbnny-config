-- PLUGINS =====================================================================

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, { desc = "Toggle Undotree" })

vim.pack.add({
    -- colours
    "https://github.com/rose-pine/neovim",
    -- i forgor sometime
    "https://github.com/folke/which-key.nvim",
    -- mini: finder and autopairs
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.pairs",
    -- tpope: surround and git integration
    "https://github.com/tpope/vim-surround",
    "https://github.com/tpope/vim-fugitive",
    -- LSP
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim"
})

--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------

require("which-key").setup({
    preset = "helix"
})

--------------------------------------------------------------------------------

require("mini.pick").setup()
vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>", { desc = "Pick Files" })
vim.keymap.set("n", "<leader>pg", "<cmd>Pick grep_live<CR>", { desc = "Pick Grep" })
vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<CR>", { desc = "Pick Buffers" })
vim.keymap.set("n", "<leader>ph", "<cmd>Pick help<CR>", { desc = "Pick Help" })

require("mini.pairs").setup()

--------------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "html", "cssls", "biome", "clangd", "cmake", "lua_ls",
    }
}

-- get rid of warnings in config files
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
