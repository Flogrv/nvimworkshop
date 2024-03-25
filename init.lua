vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
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


vim.opt.updatetime = 175
vim.opt.timeoutlen = 225

vim.opt.wrap = false

vim.opt.breakindent = true

vim.opt.smartindent = true

vim.opt.backup = false
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
--

-- Etape 3 ) Installtion de lazy vim avec un theme
-- Etape 4 ) ajout du plugin telescope
-- Etape 5 ) Ajout de treesitter (analyseur syntaxique)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }, 
    {

        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }

    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    { "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

}
local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require('telescope.builtin')
-- Telescope 
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Neotree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left<CR>')

local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })

vim.cmd[[colorscheme tokyonight]]
