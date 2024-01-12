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
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            { "neovim/nvim-lspconfig" }, -- required
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },     -- required
            { "hrsh7th/cmp-nvim-lsp" }, -- required
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "L3MON4D3/LuaSnip" }, -- required
            { "rafamadriz/friendly-snippets" },
        }
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate"
    },
    "nvim-lualine/lualine.nvim",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies =  { "nvim-lua/plenary.nvim" }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    "mbbill/undotree",
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "folke/trouble.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/zen-mode.nvim",
    "junegunn/seoul256.vim",
})
