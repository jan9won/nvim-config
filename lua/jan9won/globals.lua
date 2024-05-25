-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.conceallevel = 2
vim.g.vim_markdown_conceal = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.autoread = true

-- fat cursor
vim.opt.guicursor = ""

-- fold method
vim.opt.foldmethod = "manual"
-- line number
vim.opt.nu = true

-- relative line number
vim.opt.relativenumber = true

-- tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- swap, backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- lines
vim.opt.scrolloff = 8 -- scroll position always stays 8 lines above bottom
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80" -- vertical line

-- leader and leader timing
vim.g.mapleader = " "
vim.opt.updatetime = 50
