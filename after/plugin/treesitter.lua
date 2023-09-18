require 'nvim-treesitter.configs'.setup {
    -- list of parser names
    ensure_installed = {
        "c", "cpp", "c_sharp", "lua", "html", "css", "javascript", "python"
    },
    -- install parsers synchronously ?
    sync_install = false,
    -- auto-install missing parsers when entering buffer
    auto_install = true,
    -- duh
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
