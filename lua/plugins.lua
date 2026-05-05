local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
    -- 👇 加上这一段，解决编译超时！
    install = {
        timeout = 0, -- 永不超时（解决 Rust 编译超时）
    },
    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("config.lualine")
        end,
    },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     tag = '0.1.8',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    -- {
    --     "dmtrkovalenko/fff.nvim",
    --     build = "cargo build --release", -- 自动编译Rust
    --     event = "VeryLazy",
    --     config = function()
    --         local fff = require("fff")
    --         fff.setup({
    --             -- 常用键
    --             keymaps = {
    --                 open_files = "<leader>ff",
    --                 open_git = "<leader>fg",
    --                 open_buffers = "<leader>fb",
    --             },
    --             -- 外观
    --             border = true,
    --             winhl = "Normal:NormalFloat,FloatBorder:FloatBorder",
    --         })
    --     end,
    -- },
    {
        "ibhagwan/fzf-lua",
        event = "VeryLazy",
        config = function()
            local fzf = require("fzf-lua")

            -- 全套快捷键（和 fff 一模一样的逻辑）
            vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "查找文件" })
            vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Git 文件" })
            vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "打开的缓冲区" })
            vim.keymap.set("n", "<leader>fw", fzf.live_grep, { desc = "全局搜索文字" })
            vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "最近打开" })
            vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "帮助文档" })

            -- 简洁配置，Windows 完美运行
            fzf.setup({
                winopts = {
                    border = "single",
                    preview = { vertical = "down:40%" },
                },
                fzf_opts = {
                    ["--layout"] = "reverse",
                },
            })
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    {
        'nvim-mini/mini.nvim',
        version = false,
        config = function()
            require("config.mini")
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        -- 懒加载：Git 相关才加载
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("config.gitsigns")
        end,
    },
})
