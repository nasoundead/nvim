-- ====================== 1. mini.basics 基础全局配置 ======================


-- ====================== 2. mini.ai 智能文本对象（重点） ======================
-- 增强内置 textobject：括号、引号、函数、块、缩进 超级好用
local ai = require("mini.ai")
ai.setup({
    -- 定义查找规则
    n_lines = 500,
    custom_textobjects = {
        -- o = 代码块 { ... }
        o = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
        -- f = 函数
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        -- c = 类/结构体
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
    },
})

-- ====================== 3. mini.surround 括号引号环绕 ======================
require("mini.surround").setup({
    -- 默认快捷键完全够用，不用改
    custom_square = { bracket = "[]", bracket_outside = "[]" },
    custom_curly = { bracket = "{}", bracket_outside = "{}" },
})

-- ====================== 4. mini.pairs 自动补全括号引号 ======================
require("mini.pairs").setup({
    modes = { insert = true, command = true, terminal = false },
})

-- ====================== 5. mini.comment 快速注释 ======================
require("mini.comment").setup({
    options = {
        custom_comment = nil,
        ignore_blank_line = true,
    },
})

-- ====================== 6. mini.files 轻量化文件管理器 ======================
require("mini.files").setup({
    windows = {
        preview = true,
        width_focus = 35,
        width_preview = 60,
    },
    options = {
        use_as_default_explorer = true,
    },
})

-- ====================== 7. mini.statusline 状态栏 ======================
require("mini.statusline").setup({
    -- use_icons = false, -- Windows 终端建议关图标，避免乱码
    set_vim_settings = true,
})

-- ====================== 8. mini.indentscope 缩进参考竖线 ======================
require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
})

-- ====================== 9. mini.starter 启动页 ======================
require("mini.starter").setup({
    evaluate_single = true,
})

-- ====================== 10. mini.animate 滚动/光标动画（可选） ======================
require("mini.animate").setup({
    scroll = { enable = true },
    cursor = { enable = true },
    resize = { enable = false },
    open = { enable = false },
    close = { enable = false },
})


require("mini.trailspace").setup({})
