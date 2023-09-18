require("zen-mode").setup {
    window = {
        backdrop = 1,
        width = 88,
        height = 1,
        options = {
            signcolumn = "yes",
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
