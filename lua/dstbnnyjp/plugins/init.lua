return {

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts =
        {
            options = {
                theme = 'rose-pine',
                component_separators = { left = '┊', right = '┊' },
                section_separators = { left = '', right = '' },
            }
        }
    },

    -- language parsing & semantic highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        -- build = ":TSUpdate",
        opts =
        {
            -- list of parser names
            ensure_installed = {
                "c", "cpp", "c_sharp", "lua", "html", "css", "javascript", "python",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        }
    },

    -- undo history + undo branches
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
}
