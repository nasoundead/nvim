-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- j / k 移动太慢， ctrl + u / ctrl + d 默认移动半屏，翻太快，一不留神就不知道翻到哪了
-- 我喜欢把 ctrl + u / ctrl + d 设置成移动 9 行，演示：
keymap("n", "<C-u>", "9k", opt)
keymap("n", "<C-d>", "9j", opt)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCyclePrev<CR>", opts)
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCycleNext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete<CR>", opts)
keymap("n", "<leader>q", ":qa<CR>", opts)

-- Save with Ctrl + S
keymap("n", "<C-s>", ":w<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi<esc>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi<esc>", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-f>", "<right>", opts) --move cursor right
keymap("i", "<C-b>", "<left>", opts)  --move cursor left
keymap("i", "<C-a>", "<esc>I", opts)
keymap("i", "<C-e>", "<esc>A", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Better paste
keymap("v", "p", '"_dP', opts)




-- plugins
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
