---------- MOUSE EVENT ----------
vim.o.mouse = 'a'

---------- DIDSABLED ----------
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-t>", "<nop>")

---------- LEADER ----------
vim.g.mapleader = " "

---------- ESCAPE ----------
vim.keymap.set("i", "<C-Space>", "<Esc>")
vim.keymap.set("v", "<C-Space>", "<Esc>")
vim.keymap.set("n", "<C-Space>", "<Esc>")

---------- NAVIGATION ----------
-- navigation in normal mode
-- vim.keymap.set({ "v", "n" }, "H", "b")
-- vim.keymap.set({ "v", "n" }, "<C-h>", "B")
-- vim.keymap.set({ "v", "n" }, "<Space>h", "^")
-- vim.keymap.set({ "v", "n" }, "L", "e")
-- vim.keymap.set({ "v", "n" }, "<C-l>", "E")
-- vim.keymap.set({ "v", "n" }, "<Space>l", "$")
-- vim.keymap.set({ "v", "n" }, "K", "3k")
-- vim.keymap.set({ "v", "n" }, "<C-k>", "7k")
-- vim.keymap.set({ "v", "n" }, "<Space>k", "<C-u>zz")
vim.keymap.set({ "v", "n" }, "<C-u>", "<C-u>zz")
-- vim.keymap.set({ "v", "n" }, "J", "3j")
-- vim.keymap.set({ "v", "n" }, "<C-j>", "7j")
-- vim.keymap.set({ "v", "n" }, "<Space>j", "<C-d>zz")
vim.keymap.set({ "v", "n" }, "<C-d>", "<C-d>zz")
-- navigation in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-j>", "<Down>")

---------- DELETIE ----------
-- when deleting, keep paste buffer
vim.keymap.set("n", "d", "\"_d")
vim.keymap.set("v", "d", "\"_d")
-- delete in normal mode
vim.keymap.set("n", "dh", "\"_dh")
vim.keymap.set("n", "dH", "\"_db")
vim.keymap.set("n", "d<C-h>", "\"_dB")
vim.keymap.set("n", "d<Space>h", "\"_d^")
vim.keymap.set("n", "dl", "\"_dl")
vim.keymap.set("n", "dL", "\"_de")
vim.keymap.set("n", "d<C-l>", "\"_dE")
vim.keymap.set("n", "d<Space>l", "\"_d$")
-- delete in insert mode
vim.keymap.set("i", "<C-d>h", "<Esc>\"_dhi")
vim.keymap.set("i", "<C-d>H", "<Esc>\"_dbi")
vim.keymap.set("i", "<C-d><C-h>", "<Esc>\"_dBi")
vim.keymap.set("i", "<C-d><Space>h", "<Esc>\"_d^i")
vim.keymap.set("i", "<C-d>l", "<Esc>\"_dli")
vim.keymap.set("i", "<C-d>L", "<Esc>\"_dei")
vim.keymap.set("i", "<C-d><C-l>", "<Esc>\"_dEi")
vim.keymap.set("i", "<C-d><Space>l", "<Esc>\"_d$i")

---------- MOVE LINE ----------
vim.keymap.set('v', "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "<M-k>", ":m '<-2<CR>gv=gv")

---------- SEARCH ----------
-- when searching, keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- search and replace
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---------- JOIN ----------
-- join lines, presrve cursor position
vim.keymap.set('n', '<leader>i', 'mzJ`z') -- join lines

---------- SPLITS ----------
-- create split
vim.keymap.set("n", "ss", "<cmd>split<Return><C-w>w")
vim.keymap.set("n", "sv", "<cmd>vsplit<Return><C-w>w")
-- navigate split
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
-- move split
vim.keymap.set("n", "sr", "<C-w>r")
vim.keymap.set("n", "sH", "<C-w>H")
vim.keymap.set("n", "sK", "<C-w>K")
vim.keymap.set("n", "sJ", "<C-w>J")
vim.keymap.set("n", "sL", "<C-w>L")
-- resize split
vim.keymap.set("n", "s<left>", "<C-w>10<")
vim.keymap.set("n", "s<right>", "<C-w>10>")
vim.keymap.set("n", "s<up>", "<C-w>5+")
vim.keymap.set("n", "s<down>", "<C-w>5-")

---------- TABS ----------
-- create tabs
vim.keymap.set("n", "st", "<cmd>tabnew %<Return>")
vim.keymap.set("n", "to", "<cmd>tabnew<Return>")
-- navigate tabs
vim.keymap.set("n", "th", "<cmd>tabprevious<Return>")
vim.keymap.set("n", "tl", "<cmd>tabnext<Return>")
-- move tabs
vim.keymap.set("n", "tH", "<cmd>tabm -1<Return>")
vim.keymap.set("n", "tL", "<cmd>tabm +1<Return>")

---------- COPY/PASTE ----------
-- when pasting, keep paste buffer
vim.keymap.set("x", "p", "\"_dP")
-- copy to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

