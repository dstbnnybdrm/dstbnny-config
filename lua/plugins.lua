-- ADD/INSTALL PLUGINS =========================================================

-- add plugin to current session (or install when not present)
local add = MiniDeps.add

-- safely executes code immediately.
-- use with plugins with UI necessary to make initial screen draw.
local now = MiniDeps.now

-- schedules code to be safely executed later, preserving order.
-- use for everything else which doesn't need precisely timed effect.
local later = MiniDeps.later

-- APPEARANCE ------------------------------------------------------------------

now(function()
    -- colourscheme, my fav after seoul256 (it's just a lot more comprehensive)
    add({ source = "rose-pine/neovim" })
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
    vim.cmd("colorscheme rose-pine-dawn")

    -- status line
    add({
        source = "nvim-lualine/lualine.nvim",
        depends = {
            -- Nerd Font icons (glyphs) for use by neovim plugins
            "nvim-tree/nvim-web-devicons",
            -- provides icons with their highlighting
            "nvim-mini/mini.icons"
        }
    })
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "rose-pine",
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
        }
    })
end)

-- LANGUAGE SERVER PROTOCOL ----------------------------------------------------

now(function()
    --  Neovim treesitter config. and abstraction layer
    add({
        source = "nvim-treesitter/nvim-treesitter",
        -- master is frozen, provided for backward compatibility only
        checkout = "master",
        monitor = "main",
        -- perform after every checkout
        hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
    })
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            -- web dev
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            -- C++ dev
            "c",
            "cpp",
            "make",
            "cmake",
            -- other
            "lua",
        },
        highlight = { enable = true },
    })
end)

later(function()
    -- Mason extension to use with lspconfig
    add({
        source = "mason-org/mason-lspconfig.nvim",
        depends = {
            -- portable package manager for LSPs, DAPs, linters, and formatters
            "mason-org/mason.nvim",
            -- collection of LSP server configurations for the NVIM LSP client
            "neovim/nvim-lspconfig"
        }
    })
    require("mason").setup()
    require("mason-lspconfig").setup {
        ensure_installed = {
            -- apparently there is a regression on the latest version ?
            -- using this version so that diagnostics actually work
            "eslint@4.8.0",
        },
    }

    -- configure Language Servers
    vim.lsp.config.lua_ls = {
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
    -- enable Language Servers
    vim.lsp.enable({
        -- web dev
        "html",
        "cssls",
        "eslint",
        -- C++ dev
        "clangd",
        "cmake",
        -- other
        "lua_ls",
        "marksman"
    })


    -- formatter
    add({ source = "stevearc/conform.nvim" })
    require("conform").setup({
        async = true,
        lsp_fallback = true,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
        },
        format_on_save = {
            -- will be passed to conform.format()
            timeout_ms = 2500,
            lsp_format = "fallback",
        },
    })

    -- autocompletion, supports LSPs, cmdline, sig. help, snippets
    add({
        source = "saghen/blink.cmp",
        depends = { "rafamadriz/friendly-snippets" },
        checkout = "v1.7.0", -- check releases for latest tag
    })
    require("blink.cmp").setup({
        cmdline = { enabled = false },
        completion = {
            list = {
                selection = {
                    -- don't select by default
                    preselect = false,
                    -- auto insert on selection
                    auto_insert = true
                }
            },
        },
        -- sources = {
        --     removed "buffer" for no text completions
        --     (by default enabled when LSP returns no items)
        --     default = { "lsp", "path", "snippets" },
        -- },
    })
end)

-- QUALITY OF LIFE -------------------------------------------------------------

later(function()
    -- multi-purpose picker
    add({ source = "nvim-mini/mini.pick" })
    require("mini.pick").setup()

    -- shows available keybindings as you type
    -- i forgor sometimes lmao
    add({ source = "folke/which-key.nvim" })
    require("which-key").setup({
        preset = "helix",
    })

    -- visualizes the undo history into branches
    add({ source = "mbbill/undotree" })

    -- convenient commenting shortcuts
    add({ source = "tpope/vim-commentary" })

    -- mappings to easily delete, change and add surroundings in pairs
    add({ source = "tpope/vim-surround" })

    -- not AI lol
    -- extends and creates "around"/"inside" textobjects via treesitter
    add({ source = "nvim-mini/mini.ai" })
    require("mini.ai").setup({
        mappings = {
            -- main textobject prefixes
            around = 'a',
            inside = 'i',
            -- next/last variants
            around_next = 'an',
            inside_next = 'in',
            around_last = 'al',
            inside_last = 'il',
            -- move cursor to corresponding edge of "around" textobject
            goto_left = 'g[',
            goto_right = 'g]',
        },
    })

    -- autopair for parenthesis and braces
    add({ source = "windwp/nvim-autopairs" })
    require("nvim-autopairs").setup()

    -- pog Git wrapper
    add({ source = "tpope/vim-fugitive" })
end)
