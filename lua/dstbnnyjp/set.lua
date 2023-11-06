---- INTERFACE + APPEARANCE ----
vim.opt.termguicolors = true
vim.opt.colorcolumn = "81"

vim.opt.visualbell = true -- flash instead of DING
vim.opt.guicursor = ""    -- i like my fat cursor

vim.opt.showmode = false

vim.opt.title = false

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.fillchars = "eob:❀"
vim.opt.listchars = "tab:> ,trail:·,extends:>,precedes:<,space:·"
vim.opt.list = true

vim.g.netrw_banner = 0

---- EDITOR ----

vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- no tabs :vomit:
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

---- BACKUP DIRECTORIES ----

vim.opt.swapfile = false -- fuck you

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.opt.backupdir = os.getenv("UserProfile") .. "/.vim/backup//"
    vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undo//"
else
    vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup//"
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo//"
end
