-- only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- packer can manage itself
    use "wbthomason/packer.nvim"

    ---- LSP + PARSING ----

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- required
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- autocompletion
            { "hrsh7th/nvim-cmp" },     -- required
            { "hrsh7th/cmp-nvim-lsp" }, -- required
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            -- snippets
            { "L3MON4D3/LuaSnip" }, -- required
            { "rafamadriz/friendly-snippets" },
        }
    }
    
    -- to use non-LSPs w/ mason
    use "jose-elias-alvarez/null-ls.nvim"
    use "jay-babu/mason-null-ls.nvim"

    -- parsing for context highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    ---- INTERFACE ----

    use "nvim-lualine/lualine.nvim"
    use "folke/trouble.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use "mbbill/undotree"

    ---- UTILITY ----

    -- git integration
    use "airblade/vim-gitgutter"
    use "tpope/vim-fugitive"

    -- make life easier
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    
    use "folke/zen-mode.nvim"

    -- pretty colours :3c
    use "junegunn/seoul256.vim"
end)
