local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP setup
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', },
    'neovim/nvim-lspconfig',

    -- auto completion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',

    -- auto completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- formatting
    'stevearc/conform.nvim',

    -- diagnostics
    "folke/trouble.nvim",

    -- semantic code highlighting
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },

    -- status line
    "nvim-lualine/lualine.nvim",

    -- file searching
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- undo history + undo branches
    "mbbill/undotree",

    -- git integration
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",

    -- QOL stuff
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "folke/zen-mode.nvim",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    "liuchengxu/vista.vim",

    -- appearance
    "nvim-tree/nvim-web-devicons",
    -- "junegunn/seoul256.vim",
    { "rose-pine/neovim",          name = "rose-pine" },

    -- for school notes lol
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
})
