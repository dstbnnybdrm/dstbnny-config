local opt = vim.opt

---- INTERFACE + APPEARANCE ----
opt.termguicolors = true
opt.colorcolumn = "81"

opt.visualbell = true -- flash instead of DING
opt.guicursor = ""    -- i like my fat cursor

opt.showmode = false

opt.title = false

opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true

opt.wrap = true
opt.linebreak = true

opt.fillchars = "eob:❀"
opt.listchars = "tab:> ,trail:·,extends:>,precedes:<,space:·"
opt.list = true



---- EDITOR ----
opt.scrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 0 -- no tabs :vomit:
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.incsearch = true

opt.spell = true
opt.spelllang = { 'en_us' }

---- BACKUP DIRECTORIES ----

opt.swapfile = false -- fuck you
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

---- DIAGNOSTICS ----

opt.updatetime = 750 -- make the default NOT like 4 whole sec lol
