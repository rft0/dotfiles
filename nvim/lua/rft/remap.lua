vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- Settings --
--  vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Remaps --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("v", "<A-Up>", ">+1<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", "<-2<CR>gv=gv")


--- Save File
vim.keymap.set("i", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("v", "<C-s>", vim.cmd.w)

-- Undo / Redo
vim.api.nvim_set_keymap('i', '<C-Z>', '<C-O>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Z>', '<Esc>u', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-Y>', '<C-R>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Y>', '<C-R>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Y>', '<C-R>', { noremap = true, silent = true })

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Blank Lines
vim.o.fillchars="eob: "

-- Delete
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'D', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true, silent = true })

-- When pressed "yy" copy whole Line
vim.api.nvim_set_keymap('n', 'yy', [[:let @+ = getline('.')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'yy', [[:let @+ = getline('.')<CR>]], { noremap = true, silent = true })

-- Save with sudo
-- vim.api.nvim_set_keymap('c', 'w!!', [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]], { noremap = true, silent = true })

-- Cursor Line
vim.cmd("set cursorline")
