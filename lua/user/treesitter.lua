local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	-- one of "all" or a list of languages
	ensure_installed = { "c", "make", "lua", "cpp", "cmake", "rust", "python", "javascript", "typescript", "dot", "go" , "java", "markdown", "org", "svelte", "vim", "yaml", "json", "toml", "scss", "http"}, 
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	-- 启用增量选择
	incremental_selection = {
		enable = true,
		keymaps = {
		  init_selection = '<CR>',
		  node_incremental = '<CR>',
		  node_decremental = '<BS>',
		  scope_incremental = '<TAB>',
		}
	  },
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
