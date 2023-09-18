require("zen-mode").setup {
    window = {
        width = 80,
        height =1,
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

vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>")
