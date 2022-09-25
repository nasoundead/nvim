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

-- sv 水平分屏
-- sh 垂直分屏
-- sc 关闭当前分屏 (s = close)
-- so 关闭其他分屏 (o = other)
-- s>s<s=sjsk 分屏比例控制
keymap("n", "sv", ":vsp<CR>", opt)
keymap("n", "sh", ":sp<CR>", opt)
keymap("n", "sc", "<C-w>c", opt)
keymap("n", "so", "<C-w>o", opt) -- close others

-- 比例控制（不常用，因为支持鼠标拖拽）
keymap("n", "s>", ":vertical resize +20<CR>", opt)
keymap("n", "s<", ":vertical resize -20<CR>", opt)
keymap("n", "s=", "<C-w>=", opt)
keymap("n", "sj", ":resize +10<CR>",opt)
keymap("n", "sk", ":resize -10<CR>",opt)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save with Ctrl + S
keymap("n", "<C-s>", ":w<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi<esc>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi<esc>", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-f>", "<right>", opts)  --move cursor right
keymap("i", "<C-b>", "<left>", opts)   --move cursor left
keymap("i", "<C-a>", "<esc>I", opts)
keymap("i", "<C-e>", "<esc>A", opts)
keymap("i", "<A-f>", "<esc>wi", opts)
keymap("i", "<A-b>", "<esc>bi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- expand region
-- keymap("v", "v", "<cmd>expand_region_expand<cr>", opts)
-- keymap("v", "V", "<cmd>expand_region_shrink<cr>", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Open file in default application
keymap("n", "<leader>xo", "<Cmd> !xdg-open %<CR><CR>", opts)


-- autocmd Filetype python nnoremap <buffer> <F6> :w<CR>:vert ter python3 "%"<CR>
