-- PLUGINS =====================================================================

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, { desc = "Toggle Undotree" })

vim.pack.add({
    -- colours
    "https://github.com/rose-pine/neovim",
    -- i forgor sometime
    "https://github.com/folke/which-key.nvim",
    -- fuzzy find
    "https://github.com/nvim-mini/mini.pick",
    -- editing
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/tpope/vim-surround",
    -- git
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/airblade/vim-gitgutter",
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

-- using symbols from https://github.com/lewis6991/gitsigns.nvim lol
vim.g.gitgutter_sign_added = "┃"
vim.g.gitgutter_sign_modified = "┃"
vim.g.gitgutter_sign_removed = "_"
vim.g.gitgutter_sign_removed_first_line = "‾"
-- vim.g.gitgutter_sign_removed_above_and_below = "{"
vim.g.gitgutter_sign_modified_removed = "~"

vim.keymap.set(
    "n", "]h", "<Plug>(GitGutterNextHunk)", {
        desc = "Jump to next hunk (change)" }
)
vim.keymap.set(
    "n", "[h", "<Plug>(GitGutterPrevHunk)", {
        desc = "Jump to previous hunk (change)"
    }
)

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

-- already handled by biome
vim.lsp.config["html"] = {
    init_options = {
        provideFormatter = false
    }
}
