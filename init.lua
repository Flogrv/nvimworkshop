-- Insert des espaces a la place de tabulations
vim.opt.expandtab = true

-- Un tab = 4 espaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- la même chose en syntaxe .vimrc neovim reste retrocompatible avec vim 
-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set shiftwidth=4")

vim.opt.relativenumber = true

vim.opt.number = true

vim.opt.softtabstop = 4

vim.opt.wrap = false

vim.opt.breakindent = true

vim.opt.smartindent = true

vim.opt.swapfile = false

-- Permet de undo même apres avoir fermer le fichier
vim.opt.undofile = true

-- Sync le clipboard avec l'os
vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Active le highlight en mode recherche mais clear le highlight avec esc
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- etc etc... voir :help option-list
