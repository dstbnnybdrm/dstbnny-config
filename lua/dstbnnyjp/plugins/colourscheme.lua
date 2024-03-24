return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "dawn",      -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },

            })

            vim.cmd("colorscheme rose-pine-dawn")
        end
    }
}
