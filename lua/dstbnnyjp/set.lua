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

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

---- BACKUP DIRECTORIES ----

vim.opt.swapfile = false -- fuck you

---- DIAGNOSTICS ----

vim.diagnostic.config({ virtual_text = false })

-- show diagnostic on hover
vim.opt.updatetime = 750 -- make the default NOT like 4 whole sec lol
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
