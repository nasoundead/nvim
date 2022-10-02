
local status_rt_ok, rust_tools = pcall(require, "rust_tools")
if not status_rt_ok then
  return
end

local rt = {
    server = {
        settings = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                require 'illuminate'.on_attach(client)
            end,
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            },
        }
    },
}
rust_tools.setup(rt)
