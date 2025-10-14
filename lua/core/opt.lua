-- SET OPTIONS =================================================================

local opt = vim.opt

-- BASICS ----------------------------------------------------------------------

opt.number = true         -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true     -- Highlight current line
opt.wrap = false          -- Don't wrap lines
opt.linebreak = true      -- wrap lines at a blank
opt.scrolloff = 8         -- min rows above/below cursor
opt.sidescrolloff = 8     -- min columns left/right of cursor

-- TAB AND INDENT --------------------------------------------------------------

opt.tabstop = 4        -- Tab width
opt.shiftwidth = 4     -- Indent width
opt.softtabstop = 4    -- Soft tab stop
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true  -- Copy indent from current line

-- SEARCH ----------------------------------------------------------------------

-- ignore case in search (unless it's important lol)
opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true  -- don't highlight search results
opt.incsearch = true -- show matches as you type
-- opt.path:append("**") -- include subdirectories in search

-- APPEARANCE ------------------------------------------------------------------

opt.guicursor = ""        -- i like my fat cursor
opt.termguicolors = true  -- enable 24-bit colors
opt.signcolumn = "yes"    -- always show sign column
opt.colorcolumn = "81"    -- show column at 81 char
opt.showmatch = true      -- highlight matching brackets
opt.cmdheight = 1         -- command line height
opt.showmode = false      -- don't show mode in command line
opt.lazyredraw = true     -- don't redraw during macros
opt.winborder = "rounded" -- rounded float borders
vim.g.netrw_banner = 0    -- disable netrw banner

-- visualize whitespace
opt.listchars = "tab:> ,trail:·,extends:>,precedes:<,space:·"
opt.fillchars = "eob:❀"
opt.list = true -- show <Tab> and <EOL> chars

-- FILE HANDLING ---------------------------------------------------------------

-- no backup files
opt.backup = false
opt.writebackup = false

opt.swapfile = false -- fuck you

opt.undofile = true  -- persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- make the default NOT like 4 whole sec lol
opt.updatetime = 700
opt.timeoutlen = 1400

-- auto reload files changed outside vim
opt.autoread = true
opt.autowrite = false -- don't auto save

-- BEHAVIOUR -------------------------------------------------------------------

opt.title = false                  -- don't set title of window

opt.errorbells = false             -- no error bells PLEASE
opt.visualbell = true              -- flash instead of DING

opt.backspace = "indent,eol,start" -- better backspace behavior
opt.autochdir = false              -- Don't auto change directory
-- opt.iskeyword:append("-")           -- Treat dash as part of word
opt.encoding = "UTF-8"             -- set encoding

-- split behavior
opt.splitbelow = false
opt.splitright = true

opt.spell = true
opt.spelllang = 'en_us'

-- DIAGNOSTICS -----------------------------------------------------------------

vim.diagnostic.config({
    underline = true,
    virtual_text = {
        current_line = true,
        severity = {
            max = vim.diagnostic.severity.WARN,
        },
    },
    virtual_lines = {
        current_line = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    severity_sort = true,
})
