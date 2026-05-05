require("gitsigns").setup({
    -- 显示 Git 变更标记（最常用）
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },

    -- 工作区显示
    signcolumn = true, -- 显示在左侧标记列
    numhl = false,     -- 不高亮行号
    linehl = false,    -- 不整行高亮

    -- 快捷键（最实用的一套）
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- 定义快捷键（只在当前 buffer 生效）
        local map = function(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- 跳转到上一个 / 下一个 Git 变更
        map("n", "]h", gs.next_hunk, "Next Git hunk")
        map("n", "[h", gs.prev_hunk, "Prev Git hunk")

        -- 预览变更
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        -- 查看当前行 Git 历史
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")

        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function()
            gs.diffthis('~')
        end)
    end,
})
