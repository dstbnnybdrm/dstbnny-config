return {
    "tpope/vim-commentary",
    "tpope/vim-surround",

    {
        "folke/zen-mode.nvim",
        keys = { "n", "<leader>zm", ":ZenMode<CR>" },
        opts = {
            window = {
                width = 85,
                height = 1,
                options = {
                    signcolumn = "no",
                    number = true,
                    relativenumber = true,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = true,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,
                    showcmd = false,
                }
            }
        }
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
}
