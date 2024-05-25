local opts = { noremap = true, silent = true }

---------- MOUSE EVENT ----------
vim.o.mouse = 'a'

---------- DIDSABLED ----------
vim.keymap.set("n", "Q", "<nop>", opts)
vim.keymap.set("n", "<C-t>", "<nop>", opts)

---------- LEADER ----------
vim.g.mapleader = " "

---------- ESCAPE ----------
vim.keymap.set("i", "<C-Space>", "<Esc>", opts)
vim.keymap.set("v", "<C-Space>", "<Esc>", opts)
vim.keymap.set("n", "<C-Space>", "<Esc>", opts)

---------- NAVIGATION ----------
-- navigation in normal mode
vim.keymap.set({ "v", "n" }, "<C-u>", "<C-u>zz", opts)
vim.keymap.set({ "v", "n" }, "<C-d>", "<C-d>zz", opts)
-- navigation in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)

---------- DELETE ----------
-- WHEN DELETING, KEEP PASTE BUFFER
vim.keymap.set("n", "d", "\"_d", opts)
vim.keymap.set("v", "d", "\"_d", opts)
-- DELETE IN NORMAL MODE
--   Using default keys
-- DELETE IN INSERT MODE
--   Defined in Kitty as \x17 (or <C-w>)
-- DELETE IN TERMINAL MODE
-- vim.keymap.set('t', '<Esc>[backward-kill-word', '<Esc>ldbi', opts)  -- delete word behind

---------- MOVE LINE ----------
vim.keymap.set('v', "<M-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', "<M-k>", ":m '<-2<CR>gv=gv", opts)

---------- SEARCH ----------
-- when searching, keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
-- search and replace
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

---------- JOIN ----------
-- join lines, presrve cursor position
vim.keymap.set('n', '<leader>i', 'mzJ`z', opts) -- join lines

---------- SPLIT PANE ----------
-- create split
vim.keymap.set("n", "ss", "<cmd>split<Return><C-w>w", opts)
vim.keymap.set("n", "sv", "<cmd>vsplit<Return><C-w>w", opts)
-- navigate split
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)
-- move split
vim.keymap.set("n", "sr", "<C-w>r", opts)
vim.keymap.set("n", "sH", "<C-w>H", opts)
vim.keymap.set("n", "sK", "<C-w>K", opts)
vim.keymap.set("n", "sJ", "<C-w>J", opts)
vim.keymap.set("n", "sL", "<C-w>L", opts)
-- resize split
vim.keymap.set("n", "s<left>", "<C-w>10<", opts)
vim.keymap.set("n", "s<right>", "<C-w>10>", opts)
vim.keymap.set("n", "s<up>", "<C-w>5+", opts)
vim.keymap.set("n", "s<down>", "<C-w>5-", opts)

---------- SPLIT TAB ----------
-- create tabs
vim.keymap.set("n", "st", "<cmd>tabnew %<Return>", opts)
vim.keymap.set("n", "to", "<cmd>tabnew<Return>", opts)
-- navigate tabs
vim.keymap.set("n", "th", "<cmd>tabprevious<Return>", opts)
vim.keymap.set("n", "tl", "<cmd>tabnext<Return>", opts)
-- move tabs
vim.keymap.set("n", "tH", "<cmd>tabm -1<Return>", opts)
vim.keymap.set("n", "tL", "<cmd>tabm +1<Return>", opts)

---------- COPY/PASTE ----------
-- when pasting, keep paste buffer
vim.keymap.set("x", "p", "\"_dP", opts)
-- copy to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+Y", opts)
