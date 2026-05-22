-- SET OPTIONS =================================================================

-- BASICS ----------------------------------------------------------------------

vim.opt.number = true         -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.linebreak = true      -- wrap lines at a blank
vim.opt.scrolloff = 8         -- min rows above/below cursor
vim.opt.sidescrolloff = 8     -- min columns left/right of cursor

-- TAB AND INDENT --------------------------------------------------------------

vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Soft tab stop
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- SEARCH ----------------------------------------------------------------------

-- ignore case in search (unless it's important lol)
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = true  -- don't highlight search results
vim.opt.incsearch = true -- show matches as you type

-- APPEARANCE ------------------------------------------------------------------

vim.opt.termguicolors = true -- enable 24-bit colours
vim.opt.signcolumn = "yes"   -- always show sign column
vim.opt.colorcolumn = "81"   -- visual indicator of preferred line limit
vim.opt.showmatch = true     -- highlight matching brackets

vim.g.netrw_banner = 0       -- disable netrw banner

-- set border styles for windows and popup menus
vim.opt.winborder = "rounded"
vim.opt.pumborder = "single"

-- visualize whitespace
vim.opt.listchars = "tab:> ,trail:·,extends:>,precedes:<,space:·"
vim.opt.fillchars = "eob:❀"
vim.opt.list = true -- show <Tab> and <EOL> chars

-- FILE HANDLING ---------------------------------------------------------------

-- no backup files
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.swapfile = false -- fuck you

vim.opt.undofile = true  -- persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- make the default NOT like 4 whole sec lol
vim.opt.updatetime = 700
vim.opt.timeoutlen = 1400

-- auto reload files changed outside vim
vim.opt.autoread = true
vim.opt.autowrite = false -- don't auto save

-- BEHAVIOUR -------------------------------------------------------------------

vim.opt.title = false                  -- don't set title of window

vim.opt.errorbells = false             -- no error bells PLEASE
vim.opt.visualbell = true              -- flash instead of DING

vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false              -- Don't auto change directory
vim.opt.encoding = "UTF-8"             -- set encoding

-- split behaviour
vim.opt.splitbelow = false
vim.opt.splitright = true

-- spelling check
vim.opt.spell = true
vim.opt.spelllang = "en_gb"

-- completion
vim.opt.autocomplete = true
vim.opt.complete = "o" -- use omnifunc for completion
vim.opt.completeopt = "menuone,noselect,fuzzy,popup"
