local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remove the annoying J mapping
map("n", "J", "<nop>")

-- map leader to space
vim.g.mapleader = " "

-- stay in the middle
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "G", "Gzz", opts)
-- keep cursor in the middle of the screen
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
-- center the screen on new lines
map("n", "o", "o<esc>zzcc", opts)
map("n", "O", "O<esc>zzcc", opts)

-- system clipboard
-- requires the clipboard = "unnamedplus" option
map({ "n", "v" }, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

-- keep clipboard
map("v", "p", '"_dP', opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- window movement
map("n", "<A-h>", "<C-w>H", opts)
map("n", "<A-j>", "<C-w>J", opts)
map("n", "<A-k>", "<C-w>K", opts)
map("n", "<A-l>", "<C-w>L", opts)

-- window splitting
map("n", "<leader>sl", ":vsplit<CR><C-w>l", { noremap = true, silent = true, desc = "split right" })
map("n", "<leader>sj", ":split<CR><C-w>j", { noremap = true, silent = true, desc = "split down" })

-- window resizing
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- stay sane
-- :w of course tahts what I want
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
-- getting a little maccy I'm afraid
map("n", "<C-q>", ":q<CR>", opts)
map("i", "<C-q>", "<Esc>:q<CR>a", opts)

-- normal mode in terminal with jk
map("t", "jk", "<C-\\><C-n>", opts)
